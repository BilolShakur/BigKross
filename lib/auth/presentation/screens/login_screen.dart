import 'package:big_g_kross/auth/presentation/screens/bottom_screens/bottom_text_field_screen.dart';
import 'package:big_g_kross/auth/presentation/screens/bottom_screens/button_screen.dart';
import 'package:big_g_kross/const/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  double animatingHeight = 570;
  bool showForm = false;
  bool isRegister = false;

  Future<void> animate(bool isRe) async {
    setState(() {
      isRegister = isRe;
      animatingHeight = isRe ? 250 : 320;
    });

    // Delay helps smoother UX
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      showForm = true;
    });
  }

  Future<void> goBack() async {
    setState(() => showForm = false);

    // Wait before expanding image again
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => animatingHeight = 570);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: showForm
            ? IconButton(
                onPressed: goBack,
                icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
              )
            : null,
      ),
      body: Column(
        children: [
          // 🔹 Animated header image
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            height: animatingHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
              child: Image.asset("assets/images/matt.jpg", fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 20),

          // 🔹 AnimatedSwitcher for login/register screen
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                final slide = Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: slide,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: showForm
                  ? LoginTextField(isRegister: isRegister)
                  : ButtonScreen(
                      key: const ValueKey("buttons"),
                      onTap: animate,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
