import 'package:flutter/material.dart';

class UrlTextField extends StatelessWidget {
  final bool? isValid;
  final TextEditingController? controller;

  const UrlTextField({Key? key, this.isValid, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Shorten a link here ...',
        hintStyle: hintStyle,
        fillColor: Colors.white,
        filled: true,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  TextStyle get hintStyle {
    if (isValid == false) {
      return TextStyle(color: Colors.red);
    }
    return TextStyle();
  }

  InputBorder get border {
    if (isValid == false) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      );
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    );
  }
}
