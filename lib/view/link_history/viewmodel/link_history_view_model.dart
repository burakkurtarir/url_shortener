import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/base/model/base_error_model.dart';
import 'package:url_shortener/core/base/viewmodel/base_view_model.dart';
import 'package:url_shortener/core/components/dialog/are_you_sure_dialog.dart';
import 'package:url_shortener/core/components/dialog/error_dialog.dart';
import 'package:url_shortener/core/init/database/database_manager.dart';
import 'package:url_shortener/product/providers/short_link_provider.dart';
import 'package:url_shortener/view/home/model/short_link_model.dart';
import 'package:url_shortener/view/home/model/short_link_response.dart';
import 'package:url_shortener/view/home/service/IShortLinkService.dart';
import 'package:url_shortener/view/home/service/short_link_service.dart';

part 'link_history_view_model.g.dart';

class LinkHistoryViewModel = _LinkHistoryViewModelBase
    with _$LinkHistoryViewModel;

abstract class _LinkHistoryViewModelBase with Store, BaseViewModel {
  late IShortLinkService shortLinkService;
  late ShortLinkProvider shortLinkProvider;

  @override
  void init() {
    shortLinkService = ShortLinkService(coreDio);
    shortLinkProvider = Provider.of<ShortLinkProvider>(context!, listen: false);
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  bool isLinkValid = true;

  Future<void> getShortLink(String text) async {
    if (text.isEmpty) {
      isLinkValid = false;
      return;
    }
    isLinkValid = true;
    try {
      changeLoading();
      final response = await shortLinkService.getShortLink(
        text,
        // 'abc',
      );
      changeLoading();
      if (response.data is ShortLinkResponse) {
        shortLinkProvider.addShortLink(response.data!.result);
        DatabaseManager.instance.insertLink(response.data!.result);
      } else {
        print(response.error!.error);
      }
    } on DioError catch (e) {
      changeLoading();
      final error = BaseErrorModel.fromJson(e.response!.data);
      showErrorDialog(error.error);
    } catch (e) {
      changeLoading();
    }
  }

  void copyLink(ShortLinkModel model) {
    Clipboard.setData(ClipboardData(text: model.shortLink));
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: Text(
          'Copied to clipboard',
          style: TextStyle(fontSize: 16),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> removeLink(int index) async {
    final response = await areYouSure();
    if (response == true) {
      final code = shortLinkProvider.getShortLinkByIndex(index).code!;
      shortLinkProvider.removeShortLink(index);
      DatabaseManager.instance.removeLink(code);
    }
  }

  void showErrorDialog(String? text) {
    showDialog(
        context: context!,
        builder: (ctx) {
          return ErrorDialog(text: text ?? 'Unknown error');
        });
  }

  Future<bool?> areYouSure() async {
    return await showDialog<bool>(
        context: context!,
        builder: (ctx) {
          return AreYouSureDialog(
            onNoPressed: () {
              Navigator.pop(ctx, false);
            },
            onYesPressed: () {
              Navigator.pop(ctx, true);
            },
          );
        });
  }
}
