import 'package:flutter/material.dart';
import 'package:photo_gallery/utils/constant.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final bool showNeumorphism;
  const ActionButton({
    super.key,
    required this.icon,
    this.onTap,
    this.showNeumorphism = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 40,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
