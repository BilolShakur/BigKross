import 'package:big_g_kross/auth/presentation/widgets/login_buttons.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  final void Function(bool isRegister) onTap;
  const ButtonScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onTap(false), // login
          child: const LoginButtons(text: 'Login'),
        ),

        const SizedBox(height: 30),

        GestureDetector(
          onTap: () => onTap(true), // register
          child: const LoginButtons(text: 'Register', isWhite: false),
        ),
      ],
    );
  }
}
