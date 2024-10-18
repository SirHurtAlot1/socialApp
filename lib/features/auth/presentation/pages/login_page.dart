import 'package:flutter/material.dart';
import 'package:social_network/features/auth/presentation/pages/widgets/my_button.dart';
import 'package:social_network/features/auth/presentation/pages/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePage;

  const LoginPage({super.key, required this.togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Safe area used for not clipping with phone up bar
      body: SafeArea(
        //alignt everything in a center
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //lock icon
                Icon(
                  Icons.lock_outline,
                  size: 70,
                  color: Theme.of(context).colorScheme.primary,
                ),

                //black space between elements
                const SizedBox(height: 40),

                //hello text
                Text(
                  'Hey there! Welcome back!',
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 20),
                //custom text field for email
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                //custom text field for password with text obscure
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                MyButton(
                  onTap: () {},
                  buttonText: 'Login',
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don`t have an account? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePage,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
