import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double width;
  final Gradient gradient;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    required this.width,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
    required this.height,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, width),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color == null ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
