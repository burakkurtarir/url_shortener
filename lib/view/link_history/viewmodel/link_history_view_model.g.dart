// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_history_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LinkHistoryViewModel on _LinkHistoryViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_LinkHistoryViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLinkValidAtom = Atom(name: '_LinkHistoryViewModelBase.isLinkValid');

  @override
  bool get isLinkValid {
    _$isLinkValidAtom.reportRead();
    return super.isLinkValid;
  }

  @override
  set isLinkValid(bool value) {
    _$isLinkValidAtom.reportWrite(value, super.isLinkValid, () {
      super.isLinkValid = value;
    });
  }

  final _$_LinkHistoryViewModelBaseActionController =
      ActionController(name: '_LinkHistoryViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_LinkHistoryViewModelBaseActionController
        .startAction(name: '_LinkHistoryViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_LinkHistoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLinkValid: ${isLinkValid}
    ''';
  }
}
