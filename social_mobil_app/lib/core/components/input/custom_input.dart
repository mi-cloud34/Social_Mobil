import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final double width;
  final double height;
  final double bottom;
  final double hintSize;
  final VoidCallback onTap;
  final VoidCallback onTapSuffix;
  final IconData icon;
  final IconData iconSuffix;
  final double iconsSize;
  final Color iconColor;
  final Color iconColorSuffix;
  final double iconSuffixSize;
  final Color containerColor;
  final String Function(String value) onChanged;
  final double borderRadius;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.width,
    required this.height,
    required this.bottom,
    required this.hintSize,
    required this.onTap,
    required this.icon,
    required this.iconsSize,
    required this.iconColor,
    required this.containerColor,
    required this.onChanged,
    required this.borderRadius, required this.onTapSuffix, required this.iconSuffix, required this.iconColorSuffix, required this.iconSuffixSize,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: widget.bottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        color: widget.containerColor,
      ),
      // color: Colors.red,
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              // alignment: Alignment.topCenter,
              onPressed:widget.onTapSuffix,
              icon:  Icon(
              widget.iconSuffix,
                color: widget.iconColorSuffix,
              ),
              iconSize: widget.iconSuffixSize,
            ),
            hintText: widget.hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black38,
            ))),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your ${widget.hintText}';
          }
          return null;
        },
        maxLines: widget.maxLines,
      ),
    );
  }
}
