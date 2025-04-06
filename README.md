
# 🧠 Eğitim Koçu - Yapay Zeka Destekli Eğitim Platformu

## 📌 Proje Hakkında

Bu projede, eğitim kategorisinde genç yaş grubundaki kullanıcıların **yanlış düşünce yapılarını tespit eden ve geliştirmeye yönelik** bir yapay zeka koçluk sistemi geliştirdik.

Yapay zeka destekli bu platform, kullanıcıların sorulara yaklaşım biçimini analiz ederek, sadece cevap sunmakla kalmaz; **yanlış düşüncelerin temel sebeplerini** ortaya koyar ve **doğru düşünme yolları** sunar.

## 🚀 Özellikler

- **🧠 Yapay Zeka Destekli Çözüm ve Analiz:**  
  Kullanıcının yazdığı soruyu ve problemi analiz ederek hatalı yaklaşımları tespit eder, kullanıcıyı doğru yönlendirir.

- **🧑‍🏫 Koçluk Desteği:**  
  Soru sorma şekli ve düşünce yapısı analiz edilerek kişiye özel rehberlik sağlanır.

- **✍️ İki Metin Kutulu Sistem:**  
  Kullanıcı bir kutuda sorusunu, diğerinde anlamadığı noktayı belirtir. Yapay zeka bu bilgilerle özelleştirilmiş yanıtlar verir.

- **🗃️ Sohbet Kaydı:**  
  Yapay zeka ile yapılan tüm konuşmalar kaydedilir. Kullanıcı geçmiş analizlerine geri dönebilir.


## 🧑‍💻 Kullanılan Teknolojiler

- **Frontend:** Flutter  
- **Backend:** Python (FastAPI), WebSocket Protokolü  

## ⚙️ Kurulum ve Çalıştırma

### 1. Gereksinimleri Karşılayın
Flutter için: [Flutter Kurulum Kılavuzu](https://docs.flutter.dev/get-started/install)  
Python ortamında FastAPI kurmak için:

```bash
pip install fastapi
pip install uvicorn
```

### 2. Projeyi Klonlayın

```bash
git clone https://github.com/ZakirDmrl/Mobil_Proje/mobil_proje
cd mobil_proje
```

### 3. Backend Sunucusunu Başlatın

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### 4. Flutter Uygulamasını Çalıştırın

```bash
flutter run
```

## 📱 Uygulama Sayfaları ve Görevleri

- **Giriş Sayfası:**  
  Kullanıcının e-posta ve şifresiyle giriş yapmasını sağlar. Giriş bilgileri doğrulandıktan sonra ana sayfaya yönlendirilir.
- **Üye ol Sayfası:**  
  Kullanıcının Ad-Soyad, e-posta ve şifre bilgileriyle yeni hesap oluşturmalarını sağlar.
- **Ana Sayfa:**  
  Kullanıcının önceki sohbetlerini görebildiği ve yeni analiz başlatabileceği merkezî ekran. Yapay zeka destekli rehberlik bu sayfada başlar. Kullanıcının daha önce yaptığı tüm koçluk görüşmelerini listeler. Eski analizleri tekrar inceleyerek gelişim sağlanabilir.

- **Chat Sayfası:**  
  Kullanıcı, çözmekte zorlandığı soruyu ve anlamadığı kısmı iki ayrı metin kutusuna yazar. Bu bilgilerle yapay zeka kişiselleştirilmiş analiz sunar. Daha sonra ise Kaytet butonu ile konuşmayı kaydedebilir.

- **Profil Sayfası:**  
 Hesap bilgileri, Bildirimler gibi bilgiler gösterilir. Şifre değiştirme ve çıkış yapma de bu sayfada yer alır.
- **Hakkında Sayfası:**
 Proje hakkında bilgi verildiği sayfadır.
- **Ayarlar Sayfası:**
 Bildirim aç, Ses seviyesi ve Dil seçimi ayarlarının yapıldığı sayfadır.
- **Drawer Menü:**  
  Uygulamanın yan menüsüdür. logoyu içerir ve sayfalar arasında geçiş yapılmasını sağlar.

## 🧪 Kullanım

Uygulama açıldığında kullanıcıyı iki metin kutusu karşılar:

- **Soru Metin Kutusu:** Kullanıcı burada çözmek istediği soruyu yazar.  
- **Sorun Metin Kutusu:** Anlamadığı, takıldığı veya çözüme ulaşamadığı detayları belirtir.

Yapay zeka bu bilgilerle derinlemesine analiz yapar ve kişiye özel koçluk sağlar. Ayrıca tüm sohbetler kaydedilerek kullanıcının geçmiş hatalarını incelemesi sağlanır.

## 🧬 Teknik Detaylar

### 🎓 Yapay Zeka Koçluk Mekanizması

Model, kullanıcının hatalı düşünce yapısını analiz ederek düzeltme ve farkındalık kazandırma amacıyla çalışır. Kullanıcıya yalnızca “doğru cevabı” değil, **doğru düşünce sistematiğini** öğretmeye odaklanır.

### ⚙️ Teknik Sorunlar ve Çözümler

- **WebSocket ile Canlı Geri Bildirim:** WebSocket sayesinde sorulara gerçek zamanlı analiz ve cevap dönülmektedir.

## 📁 Drawer Menüdeki Logo API Bilgisi

Drawer menüsünde kullanılan logo aşağıdaki API üzerinden dinamik olarak alınmaktadır:

- **API Adresi:** `https://upload.wikimedia.org/wikipedia/commons/d/dd/Izulogoyuvarlak.png`
- **Veri Tipi:** JSON (`logoUrl` key'i ile alınır)

## 🔐 Giriş Bilgilerinin Saklanması

- Giriş sonrası bilgiler `SecureStorage` ile şifreli olarak saklanır.  
- Oturum yönetimi `SharedPreferences` ile sağlanır.  
- Şifreler açık olarak tutulmaz; **base64 encode** ve tercihen hash algoritması ile korunur.

## 👥 Takım Üyeleri ve Katkıları

| İsim                      | Katkı Alanı                                                                 |
|---------------------------|------------------------------------------------------------------------------|
| **Burak CAN**             | Backend geliştirici (FastAPI), yapay zeka entegrasyonu, kısa sınav mekanizması |
| **Muhammed Zakir DEMİREL** | Frontend geliştirici (Flutter), metin kutusu yapısı, sohbet geçmişi, API bağlantısı |
| **Oğuzhan TOZLU**         | Tasarım, testler, kullanıcı deneyimi optimizasyonları, logo API bağlantısı     |

## 🗨️ Ek Notlar

- Kod yapısı modüler olacak şekilde düzenlenmiştir.
- Flutter tarafında responsive tasarıma önem verilmiştir.
- Proje, MVVM mimarisine benzer bir yapı ile yönetilmiştir.
- Backend ve frontend ayrı çalışabilir şekilde tasarlanmıştır.

## 📄 Lisans

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.  
İsteyen herkes kaynak kodu inceleyebilir, kullanabilir ve katkı sağlayabilir.
