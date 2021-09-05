import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_shortener/core/constants/asset_constants.dart';
import 'package:url_shortener/core/extensions/context_extension.dart';
import 'package:url_shortener/view/home/ui/shorten_it_button.dart';
import 'package:url_shortener/view/home/ui/url_text_field.dart';

class ShortLinkContainer extends StatelessWidget {
  final bool? isValid;
  final TextEditingController? textEditingController;
  final VoidCallback? onPressed;
  final bool? isLoading;

  const ShortLinkContainer(
      {Key? key,
      this.isValid,
      this.textEditingController,
      this.onPressed,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Color(0xff3B3054),
      height: 170,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -20,
            right: 0,
            child: SvgPicture.asset(
              AssetConstants.instance.shape,
              width: context.width * 0.65,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: UrlTextField(
                  controller: textEditingController,
                  isValid: isValid,
                ),
              ),
              SizedBox(height: 12),
              ShortenItButton(
                onPressed: onPressed,
                isLoading: isLoading,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
