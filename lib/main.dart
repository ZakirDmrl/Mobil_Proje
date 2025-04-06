import 'package:frontend/Ui/screen/app/main_app.dart';
import 'package:frontend/Ui/screen/chat/chat_screen.dart';
import 'package:frontend/Ui/screen/drawer_pages/about_us_screen.dart';
import 'package:frontend/Ui/screen/drawer_pages/profile_screen.dart';
import 'package:frontend/Ui/screen/drawer_pages/settings_screen.dart';
import 'package:frontend/Ui/screen/log_sign/log_sign_screen.dart';
import 'package:frontend/Ui/screen/login/view/login_screen.dart';
import 'package:frontend/Ui/screen/main/main_screen.dart';
import 'package:frontend/Ui/screen/signup/view/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainApp(),
      routes: {
        "LogSignScreen": (context) => const LogSignScreen(),
        "/loginscreen": (context) => const LoginScreen(),
        "/signupscreen": (context) => const SignUpScreen(),
        "/chat_screen": (context) => const ChatScreen(
              sessionTitle: '',
            ),
        "/mainscreen": (context) => MainScreen(),
        "/settings_screen": (context) => const SettingsScreen(),
        "/profile_screen": (context) => const ProfileScreen(),
        "/about_us_screen": (context) => const AboutUsScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
