import 'package:flutter/material.dart';
import '../utils/apptextstyle.dart';
import '../utils/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;

  const CustomAppbar({
    super.key,
    required this.title,
    this.leftIcon,
    this.rightIcon,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.backround,
        border: Border(bottom: BorderSide(color: AppColors.primary, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (leftIcon != null)
                IconButton(
                  onPressed: onLeftPressed,
                  icon: Icon(leftIcon, color: AppColors.primary, size: 30),
                )
              else
                const SizedBox(width: 20),
              Text(
                title,
                style: AppTextStyle.paragraph.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          if (rightIcon != null)
            IconButton(
              onPressed: onRightPressed,
              icon: Icon(rightIcon, color: AppColors.primary),
            )
          else
            const SizedBox(width: 48),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
