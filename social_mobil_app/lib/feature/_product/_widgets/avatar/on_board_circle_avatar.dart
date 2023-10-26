import 'package:flutter/material.dart';
import 'package:social_mobil_app/core/extensions/context_extension.dart';

class OnBoardCircle extends StatelessWidget {
  const OnBoardCircle({Key? key, this.isSelected, this.color, this.radius})
      : super(key: key);
  final bool? isSelected;
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor: color,
        radius:radius
           
      ),
    );
  }
}
