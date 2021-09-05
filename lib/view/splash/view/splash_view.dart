import 'package:flutter/material.dart';
import 'package:url_shortener/core/base/view/base_view.dart';
import 'package:url_shortener/view/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      builder: (BuildContext context, value) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Text('Loading'),
            ),
          ),
        );
      },
      onReady: (SplashViewModel? model) {
        model!.setContext(context);
        model.init();
      },
      viewModel: SplashViewModel(),
    );
  }
}
