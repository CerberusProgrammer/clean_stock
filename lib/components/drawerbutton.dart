import 'package:flutter/material.dart';

class Drawerbutton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final IconData? icon;
  final IconData? secondaryIcon;
  final Function() onTap;

  const Drawerbutton({
    super.key,
    required this.title,
    this.icon,
    required this.onTap,
    required this.isSelected,
    this.secondaryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 52),
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null || secondaryIcon != null)
            Icon(isSelected ? icon : secondaryIcon),
          const SizedBox(width: 24),
          Text(title),
        ],
      ),
    );
  }
}
