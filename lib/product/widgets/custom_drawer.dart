import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? logoUrl;

  @override
  void initState() {
    super.initState();
    fetchLogoUrl();
  }

  // JSON dosyasını okuma fonksiyonu
  Future<void> fetchLogoUrl() async {
    // JSON dosyasını assets klasöründen yükle
    final String response = await rootBundle.loadString('assets/logo.json');
    final data = json.decode(response); // JSON verisini çözümle
    setState(() {
      logoUrl = data['logoUrl']; // logoUrl'u al
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo URL'si dinamik olarak çekiliyor
                logoUrl != null
                    ? Image.network(
                        logoUrl!,
                        height: 60,
                        fit: BoxFit.contain,
                      )
                    : CircularProgressIndicator(), // Yüklenene kadar bir yükleme simgesi gösterilir
                const SizedBox(height: 10),
                const Text(
                  'Mobil Proje',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/mainscreen");
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/profile_screen");
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Hakkımızda'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/about_us_screen");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/settings_screen");
            },
          ),
        ],
      ),
    );
  }
}
