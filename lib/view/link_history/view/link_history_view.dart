import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/base/view/base_view.dart';
import 'package:url_shortener/core/extensions/context_extension.dart';
import 'package:url_shortener/product/providers/short_link_provider.dart';
import 'package:url_shortener/view/home/ui/short_link_container.dart';
import 'package:url_shortener/view/link_history/ui/link_history_card.dart';
import 'package:url_shortener/view/link_history/viewmodel/link_history_view_model.dart';

class LinkHistoryView extends StatelessWidget {
  LinkHistoryView({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final shortLinkProvider = Provider.of<ShortLinkProvider>(context);

    return BaseView<LinkHistoryViewModel>(
      builder: (BuildContext context, viewModel) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Text(
                      'Your History',
                      style: context.textTheme.headline5!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      itemCount: shortLinkProvider.shortLinkHistory.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = shortLinkProvider.shortLinkHistory[index];

                        return LinkHistoryCard(
                          model: data,
                          onPressed: (value) {
                            viewModel.copyLink(value);
                          },
                          onDeletePressed: (value) {
                            viewModel.removeLink(index);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 16,
                      ),
                    ),
                  ),
                  Observer(builder: (_) {
                    return ShortLinkContainer(
                      textEditingController: textController,
                      isLoading: viewModel.isLoading,
                      isValid: viewModel.isLinkValid,
                      onPressed: () {
                        viewModel.getShortLink(textController.text);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
      onReady: (LinkHistoryViewModel? model) {
        model!.setContext(context);
        model.init();
      },
      viewModel: LinkHistoryViewModel(),
    );
  }
}
