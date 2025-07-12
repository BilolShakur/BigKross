import 'package:big_g_kross/auth/presentation/widgets/login_buttons.dart';
import 'package:big_g_kross/auth/presentation/widgets/tect_field.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final bool isRegister; // 🔹 New flag

  const LoginTextField({super.key, this.isRegister = false});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      if (widget.isRegister) {
        final name = _nameController.text.trim();
        print('Registering: $email / $password / $name');
      } else {
        print('Logging in: $email / $password');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRegister = widget.isRegister;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isRegister) ...[
              CustomTextField(
                label: "Full Name",
                isRequired: true,
                controller: _nameController,
              ),
              const SizedBox(height: 40),
            ],

            CustomTextField(
              label: "Email",
              keyboardType: TextInputType.emailAddress,
              isRequired: true,
              controller: _emailController,

              validator: (value) {
                if (!value!.contains('@')) return "Enter a valid email";
                return null;
              },
            ),
            const SizedBox(height: 40),

            CustomTextField(
              label: "Password",
              isPassword: true,
              isRequired: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 40),

            if (isRegister)
              CustomTextField(
                label: "Confirm Password",
                isPassword: true,
                isRequired: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return "Passwords don't match";
                  }
                  return null;
                },
              ),

            const SizedBox(height: 60),

            GestureDetector(
              onTap: _handleSubmit,
              child: LoginButtons(text: isRegister ? "Register" : "Login"),
            ),
          ],
        ),
      ),
    );
  }
}
