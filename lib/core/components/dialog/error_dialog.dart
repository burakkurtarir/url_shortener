import 'package:flutter/material.dart';
import 'package:url_shortener/core/extensions/context_extension.dart';

class ErrorDialog extends StatelessWidget {
  final String text;

  const ErrorDialog({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is an error',
              style: context.textTheme.headline6!,
            ),
            SizedBox(height: 16),
            Text(
              text,
              style: context.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
