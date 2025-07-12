import 'package:big_g_kross/const/app_colors.dart';
import 'package:big_g_kross/const/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isRequired;

  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.isRequired = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscure,
        style: AppTextStyles.onDark,
        validator: (value) {
          if (widget.isRequired && (value == null || value.trim().isEmpty)) {
            return '${widget.label} is required';
          }
          if (widget.validator != null) {
            return widget.validator!(value);
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: AppTextStyles.heading1.copyWith(color: AppColors.gray),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.gray,
                  ),
                  onPressed: () {
                    setState(() => _obscure = !_obscure);
                  },
                )
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.4),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent, width: 1.4),
          ),
        ),
      ),
    );
  }
}
