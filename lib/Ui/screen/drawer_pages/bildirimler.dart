import 'package:flutter/material.dart';
import 'package:frontend/product/widgets/custom_drawer.dart';

class Bildirimler extends StatelessWidget {
  const Bildirimler({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      'Yeni görev yüklendi!',
      'Profiliniz başarıyla güncellendi.',
      'Uygulama güncellemesi mevcut.',
      'Bildirim ayarlarınızı gözden geçirin.',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        automaticallyImplyLeading: true,
        title: Center(
          child: const Text(
            'Bildirimler',
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[850],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                notifications[index],
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}
