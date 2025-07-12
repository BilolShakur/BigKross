import 'package:flutter/material.dart';
import 'app_colors.dart'; // Make sure this exists or adjust path

class AppTextStyles {
  const AppTextStyles._(); // prevent instantiation

  // 🔠 Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    letterSpacing: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    letterSpacing: 1.1,
  );

  // 📝 Body Text
  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    height: 1.5,
  );

  static const TextStyle bodyLight = TextStyle(
    fontSize: 16,
    color: AppColors.gray,
    height: 1.5,
  );

  // 🧾 Small text / captions
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.gray,
  );

  // 🔴 Accent / call-to-action
  static const TextStyle accent = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.red,
  );

  // ⚪ On dark (e.g. white text over black background)
  static const TextStyle onDark = TextStyle(
    fontSize: 16,
    color: AppColors.white,
  );

  static get bodyDark => null;
}
