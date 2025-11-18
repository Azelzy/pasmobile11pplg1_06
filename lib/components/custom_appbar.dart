
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
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      color: AppColors.backround,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (leftIcon != null)
            IconButton(
                onPressed: onLeftPressed,
                icon: Icon(leftIcon, color: AppColors.secondary, size: 30)
            )
          else const SizedBox(width: 20),
          Text(
            title, style: AppTextStyle.paragraph.copyWith(fontWeight: FontWeight.bold),
          ),
          if (rightIcon != null)
            IconButton(
                onPressed: onLeftPressed,
                icon: Icon(rightIcon)
            )
          else const SizedBox(width: 48),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}