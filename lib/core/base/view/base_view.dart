import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) builder;
  final T viewModel;
  final Function(T model) onReady;
  final VoidCallback? onDispose;
  final VoidCallback? onReassemble;

  BaseView({
    Key? key,
    required this.builder,
    required this.viewModel,
    required this.onReady,
    this.onDispose,
    this.onReassemble,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.viewModel;
    widget.onReady(viewModel);
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (widget.onReassemble != null) widget.onReassemble!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, viewModel);
  }
}
