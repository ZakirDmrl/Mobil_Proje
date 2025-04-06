import os
import google.generativeai as genai
from dotenv import load_dotenv

load_dotenv()


def configure_gemini():
    api_key = os.getenv("GEMINI_API_KEY")  # Doğru değişken adı
	
    if not api_key:
        raise ValueError("Gemini API anahtarı bulunamadı! Lütfen .env dosyanı kontrol et.")
    
    genai.configure(api_key=api_key)  # API anahtarını kullanarak yapılandır
    return genai


# İstek ayarları (örn. sıcaklık, top_p, top_k)
generation_config = {
  "temperature": 1,
  "top_p": 0.95,
  "top_k": 64,
  "max_output_tokens": 8192,
  "response_mime_type": "text/plain",
}
