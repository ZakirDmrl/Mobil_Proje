import 'package:flutter/material.dart';
import 'package:frontend/Ui/screen/drawer_pages/bildirimler.dart';
import 'package:frontend/Ui/screen/drawer_pages/hesap_bilgileri.dart';
import 'package:frontend/Ui/screen/drawer_pages/sifre_degistir.dart';

import '../../../product/widgets/custom_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C),
        automaticallyImplyLeading: true,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              foregroundImage: NetworkImage(
                'https://img.freepik.com/vector-gratis/establecimiento-circulos-usuarios_78370-4704.jpg',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Muhammed Zakir',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 4),
            const Text(
              'zakir@example.com',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            ProfileMenuItem(
              icon: Icons.person,
              title: 'Hesap Bilgileri',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HesapBilgileri(),
                    ));
              },
            ),
            ProfileMenuItem(
              icon: Icons.notifications,
              title: 'Bildirimler',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bildirimler(),
                    ));
              },
            ),
            ProfileMenuItem(
              icon: Icons.lock,
              title: 'Şifre Değiştir',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SifreDegistir(),
                    ));
              },
            ),
            ProfileMenuItem(
              icon: Icons.logout,
              title: 'Çıkış Yap',
              onTap: () {
                Navigator.popUntil(
                    context, ModalRoute.withName("/loginscreen"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: onTap,
      ),
    );
  }
}
