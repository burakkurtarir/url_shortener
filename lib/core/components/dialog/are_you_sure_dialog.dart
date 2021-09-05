import 'package:flutter/material.dart';
import 'package:url_shortener/core/extensions/context_extension.dart';

class AreYouSureDialog extends StatelessWidget {
  final VoidCallback? onYesPressed;
  final VoidCallback? onNoPressed;

  const AreYouSureDialog({
    Key? key,
    this.onYesPressed,
    this.onNoPressed,
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
              'Emin misin ?',
              style: context.textTheme.headline6!,
            ),
            SizedBox(height: 12),
            Text(
              'Silmek istediğine emin misin ?',
              style: context.textTheme.bodyText1,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: onNoPressed, child: Text('Hayır')),
                SizedBox(width: 20),
                TextButton(onPressed: onYesPressed, child: Text('Evet')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
