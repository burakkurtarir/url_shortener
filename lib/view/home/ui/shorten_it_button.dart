import 'package:flutter/material.dart';

class ShortenItButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool? isLoading;

  const ShortenItButton({
    Key? key,
    this.onPressed,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading == false ? onPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: Color(0xff2ACFCF),
        minimumSize: Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String get buttonText {
    if (isLoading == true) {
      return 'PLEASE WAIT';
    }
    return 'SHORTEN IT';
  }
}
