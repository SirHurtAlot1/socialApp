/*

this page used for presentation of login page or register page depending on situation


*/

import 'package:flutter/widgets.dart';
import 'package:social_network/features/auth/presentation/pages/login_page.dart';
import 'package:social_network/features/auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  bool showLoginPage = true;
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(togglePage: togglePages,);
    } else {
      return RegisterPage(togglePage: togglePages,);
    }
  }
}