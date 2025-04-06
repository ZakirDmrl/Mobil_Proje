import 'package:flutter/material.dart';
import 'package:frontend/product/widgets/custom_drawer.dart';

class SifreDegistir extends StatelessWidget {
  const SifreDegistir({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        automaticallyImplyLeading: true,
        title: Center(
          child: const Text(
            'Şifre Değiştir',
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text(
          "Bakım Aşamasında",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
