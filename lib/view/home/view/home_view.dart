import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_shortener/core/base/view/base_view.dart';
import 'package:url_shortener/core/constants/asset_constants.dart';
import 'package:url_shortener/core/extensions/context_extension.dart';
import 'package:url_shortener/view/home/ui/short_link_container.dart';
import 'package:url_shortener/view/home/viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (BuildContext context, viewModel) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  width: context.width,
                  height: context.height,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Shortly',
                              style: context.textTheme.headline4,
                            ),
                          ),
                          SvgPicture.asset(
                            AssetConstants.instance.illustration,
                            width: context.width,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lets\'s get started!',
                            style: context.textTheme.headline5,
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'Paste your first link into the field to shorten it',
                              style: context.textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      Spacer(),
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
            ),
          ),
        );
      },
      onReady: (HomeViewModel? model) {
        model!.setContext(context);
        model.init();
      },
      viewModel: HomeViewModel(),
    );
  }
}

/* 
Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SvgPicture.asset(AssetConstants.instance.illustration),
                        
                      ],
                    ),
                  )),
                  Container(
                    color: Colors.red,
                    width: context.width,
                    height: 170,
                    child: UrlTextField(),
                  ),
                ],
              ),
*/