import 'package:flutter/material.dart';
import 'package:mini_shopping_app/core/utils/styels.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width = double.infinity,
  });
  final VoidCallback? onTap;
  final String text;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Styles.kprimarycolor,
          borderRadius: BorderRadius.circular(16),
        ),
        width: width,
        height: 60,
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
