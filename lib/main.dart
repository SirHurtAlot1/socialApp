import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_network/features/auth/presentation/pages/widgets/auth_page.dart';
import 'package:social_network/firebase_options.dart';
import 'package:social_network/themes/light_mode.dart';

void main() async{
  //need to setup firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //run app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthPage()
    );
  }
}
