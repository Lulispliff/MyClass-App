import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;

  const ButtonApp({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(130, 30),
        backgroundColor: color ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
