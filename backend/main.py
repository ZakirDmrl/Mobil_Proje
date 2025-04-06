import logging 
from fastapi import FastAPI, WebSocket
from config import generation_config, configure_gemini
from utils import clean_response  # clean_response fonksiyonu buradan çekiliyor
import google.generativeai as genai
import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime

# Logging yapılandırması
logging.basicConfig(level=logging.INFO)

# FastAPI başlat
app = FastAPI()
genai = configure_gemini()

# Firebase başlat
cred = credentials.Certificate("mobilproje-df99d-firebase-adminsdk-fbsvc-549a55320b.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

# Model tanımla
model = genai.GenerativeModel(
    model_name="gemini-1.5-flash",
    generation_config=generation_config,
    system_instruction=(
        "Sen, ortaokul ve lise çağındaki öğrencilere matematik konularında yardımcı olan bir öğretmensin. "
        "Görevlerin, öğrencilerin zorlandığı konularda samimi bir şekilde rehberlik etmek ve onlara problem çözme becerilerini geliştirmekte destek olmaktır. "
        "Öğrencilerin sorularını dikkatlice dinle, onlara açıklayıcı bir dille yanıt ver ve anlamalarına yardımcı ol. "
        "Eğer bir öğrencinin yanlış anladığı veya eksik kaldığı bir nokta varsa, bunu nazikçe belirt ve onlara bu konularda pratik yapmaları için uygun sorular öner. "
        "Her zaman pozitif bir dil kullan ve öğrencinin özgüvenini artıracak bir yaklaşım benimse. "
        "Ayrıca, öğrencilerin öğrenim süreçlerini desteklemek sorduğu sorularda anlamadıkları noktaları analiz et ve bu konulara göre öğrenciler için onlara haftalık quizler hazırlayarak, yanlış anladıkları noktaları pekiştirmelerine yardımcı ol."
    ),
)

# Firebase'e konuşmayı kaydetme fonksiyonu
def save_conversation(task, context, response):
    try:
        # timestamp ekleniyor
        timestamp = datetime.now().isoformat()
        doc_ref = db.collection("chat").document()
        doc_ref.set({
            "task": task,
            "context": context,
            "response": response,
            "timestamp": timestamp
        })
        logging.info(f"✅ Firebase'e başarıyla kaydedildi: {task}")
        print(doc_ref.id)
        return doc_ref.id  
    except Exception as e:
        logging.error(f"❌ Firebase'e kayıt hatası: {e}")
        return None

# WebSocket ile etkileşim
@app.websocket("/ws/ask_gemini")
async def ask_gemini(websocket: WebSocket):
    await websocket.accept()
    logging.info("🟢 WebSocket bağlantısı açıldı.")

    while True:
        try:
            data = await websocket.receive_text()
            logging.info(f"📩 Kullanıcıdan gelen veri: {data}")

            # Kaydetme işlemi kontrolü
            if data.lower().startswith("kaydet"):
                parts = data.split("|")
                if len(parts) == 4:
                    task, context, response = parts[1], parts[2], parts[3]
                    save_result = save_conversation(task, context, response)
                    
                    if save_result:
                        await websocket.send_text("✅ Konuşma başarıyla kaydedildi.")
                    else:
                        await websocket.send_text("❌ Firebase kaydetme hatası.")
                    
                    break  # Kaydedildikten sonra bağlantıyı kapat

            # Modelden yanıt al
            prompt = f"Görev: {data}"
            response = model.generate_content(prompt)
            clean_text = clean_response(response.text)  # ← TEMİZLEME BURADA

            logging.info(f"📨 Model yanıtı: {clean_text}")
            await websocket.send_text(clean_text)

        except Exception as e:
            logging.error(f"⚠️ WebSocket Hatası: {e}")
            await websocket.send_text(f"Hata: {str(e)}")
            break

    logging.info("🔴 WebSocket bağlantısı kapatıldı.")
    await websocket.close()
