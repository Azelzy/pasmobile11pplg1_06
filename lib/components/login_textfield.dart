import 'package:flutter/material.dart';
import '../utils/apptextstyle.dart';
import '../utils/colors.dart';

class LoginTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool obscure;
  final VoidCallback? onToggleObscrure;
  final IconData? prefixIcon;

  const LoginTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.obscure = false,
    this.onToggleObscrure,
    this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? obscure : false,
      style: AppTextStyle.paragraph,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.paragraph.copyWith(color: AppColors.secondary2),
        filled: true,
        fillColor: AppColors.white,
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.secondary2, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary, width: 1),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: AppColors.primary)
            : null,
        suffixIcon: isPassword
            ? IconButton(
          onPressed: onToggleObscrure,
          icon: Icon(
            obscure
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: AppColors.primary,
          ),
        )
            : null,
      ),
    );
  }
}