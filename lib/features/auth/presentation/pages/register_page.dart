import 'package:flutter/material.dart';
import 'package:social_network/features/auth/presentation/pages/widgets/my_button.dart';
import 'package:social_network/features/auth/presentation/pages/widgets/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePage;
  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

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
                  'Create a new account',
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 20),
                //custom text field for name
                MyTextField(
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false,
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
                  obscureText: false,
                ),
                const SizedBox(height: 20),

                //custom text field for confirm password with text obscure
                MyTextField(
                  controller: passwordConfirmController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                MyButton(
                  onTap: () {},
                  buttonText: 'Register',
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePage,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w700),
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
