import 'package:flutter/material.dart';

class PaperInput extends StatelessWidget {
  const PaperInput({
    required this.labelText,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.controller,
    this.maxLines,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
     
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
      ),
    );
  }
}
