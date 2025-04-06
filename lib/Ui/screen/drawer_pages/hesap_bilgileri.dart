import 'package:flutter/material.dart';

import '../../../product/widgets/custom_drawer.dart';

class HesapBilgileri extends StatelessWidget {
  const HesapBilgileri({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        automaticallyImplyLeading: true,
        title: Center(
          child: const Text(
            'Profil',
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              'Muhammed Zakir Demirel', // Kullanıcı adınızı veya isminizi buraya ekleyin
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'muhammed.zakir@ornek.com', // Kullanıcı e-posta adresinizi buraya ekleyin
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
