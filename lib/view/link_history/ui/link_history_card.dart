import 'package:flutter/material.dart';
import 'package:url_shortener/core/extensions/context_extension.dart';
import 'package:url_shortener/view/home/model/short_link_model.dart';

class LinkHistoryCard extends StatelessWidget {
  final ShortLinkModel model;
  final Function(ShortLinkModel value)? onPressed;
  final Function(ShortLinkModel value)? onDeletePressed;

  const LinkHistoryCard({
    Key? key,
    required this.model,
    this.onPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${model.originalLink}',
                  style: context.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () => onDeletePressed!(model),
                child: Icon(Icons.delete),
              ),
            ],
          ),
          Divider(),
          Text(
            '${model.shortLink}',
            style: context.textTheme.bodyText1!.copyWith(
              color: Color(0xff2ACFCF),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: context.width,
            child: TextButton(
              onPressed: () => onPressed!(model),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff2ACFCF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'COPY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
