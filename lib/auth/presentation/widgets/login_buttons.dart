import 'package:flutter/material.dart';

import 'package:big_g_kross/const/app_colors.dart';
import 'package:big_g_kross/const/app_text_styles.dart';

class LoginButtons extends StatelessWidget {
  final String text;
  final bool isWhite;
  const LoginButtons({Key? key, required this.text, this.isWhite = true})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 330,
      decoration: BoxDecoration(
        border: Border.all(width: isWhite ? 0 : 1, color: AppColors.white),

        color: isWhite ? AppColors.white : AppColors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.heading2.copyWith(
            color: isWhite ? AppColors.black : AppColors.white,
          ),
        ),
      ),
    );
  }
}
