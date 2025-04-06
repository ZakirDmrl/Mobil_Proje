import 'package:flutter/material.dart';

import '../../../product/widgets/custom_drawer.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        automaticallyImplyLeading: true,
        title: const Text('Hakkımızda', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: const Text(
          'Bu mobil uygulama, kullanıcıların sohbetler aracılığıyla görevler oluşturmasını, düzenlemesini ve yönetmesini sağlar. '
          'Mobil Uygulama Geliştirtirme projesi kapsamında geliştirilmiştir.\n\n'
          'Yapanlar: Muhammed Zakir Demirel, Oğuzhan Yusuf Tozlu ve Burak Can\n'
          'Amaç: Eğitim, İletişim ve Yapay Zekâ Destekli Yardım',
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ),
    );
  }
}
