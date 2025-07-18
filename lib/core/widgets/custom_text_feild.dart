import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.maxLines = 1,
    this.onChanged,
    this.color = Colors.black,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLines;
  final void Function(String)? onChanged;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscureText,
      onSaved: onSaved,
      style: TextStyle(
        color: color, // 👈 This changes the text color
        fontFamily: 'TenorSans',
        fontWeight: FontWeight.w400,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF9B9B9B),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        filled: true,
        fillColor: Colors.transparent,

        border: buildUnderlineBorder(),
        enabledBorder: buildUnderlineBorder(),
        focusedBorder: buildUnderlineBorder(),
      ),

      onChanged: onChanged,
    );
  }

  OutlineInputBorder bulidBoarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1.0),
    );
  }

  UnderlineInputBorder buildUnderlineBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    );
  }
}
