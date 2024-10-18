import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;

  const MyButton({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)
      
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
