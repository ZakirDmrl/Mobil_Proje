import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String sessionTitle;

  const ChatScreen({super.key, required this.sessionTitle});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final WebSocketChannel _channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.0.30:8000/ws/ask_gemini'),
  );

  String _response = '';
  String _debugMessage = '';
  bool isSending = false;

  Future<void> sendRequest() async {
    if (isSending) return;

    setState(() {
      isSending = true;
      _debugMessage = "📤 Modelden yanıt bekleniyor...";
    });

    final task = _taskController.text;
    _channel.sink.add(task);

    _channel.stream.listen((message) {
      setState(() {
        _response = message;
        _debugMessage = "✅ Yanıt alındı!";
        isSending = false;
      });
    }, onError: (error) {
      setState(() {
        _debugMessage = "❌ WebSocket hatası: $error";
        isSending = false;
      });
    });
  }

  Future<void> saveConversation() async {
    final task = _taskController.text.trim();
    final content = _contentController.text.trim();
    final response = _response.trim();

    if (task.isEmpty) {
      setState(() => _debugMessage = "⚠️ Lütfen işlem alanını doldurun.");
      return;
    }

    if (content.isEmpty) {
      setState(() => _debugMessage = "⚠️ Lütfen soru alanını doldurun.");
      return;
    }

    if (response.isEmpty) {
      setState(() => _debugMessage =
          "⚠️ Lütfen önce 'Gönder' butonuna basarak modelden yanıt alın.");
      return;
    }

    setState(() => _debugMessage = "📤 Firebase'e kaydediliyor...");

    _channel.sink.add("kaydet|$task|$content|$response");

    await Future.delayed(const Duration(milliseconds: 500));
    if (context.mounted) {
      Navigator.pop(context, task);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        title: Text(widget.sessionTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: 'İşlem',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Sorulacak Soru',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: sendRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Gönder'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: saveConversation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Kaydet'),
            ),
            const SizedBox(height: 20),
            const Text('Yanıt:', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 20),
            Text(
              _response.isNotEmpty ? _response : 'Nasıl Yardımcı Olabilirim?',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text('🔎 Debug:',
                style: TextStyle(color: Colors.amberAccent)),
            Text(_debugMessage, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
