
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final String? Function(String?)? onChanged;
  final int? maxLines;
  final int? maxLength;
  final String? labelText;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText = "",
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.maxLines,
    this.maxLength,
    this.labelText,
    this.obscureText = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: bgColor,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      maxLength: maxLength,
      onTap: onTap,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: bgColor, width: 3),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
        prefixIcon: prefix,
        suffixIcon: suffix,
        label: Text("$labelText"),
        labelStyle: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}
