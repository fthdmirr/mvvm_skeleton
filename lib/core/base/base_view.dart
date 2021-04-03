import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final T viewModel;
  final Function(T viewModel) onBaseReady;
  final VoidCallback? onBaseDispose;
  final Widget Function(BuildContext context, T viewModel) onBaseBuilder;

  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onBaseReady,
    required this.onBaseBuilder,
    this.onBaseDispose,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T viewModel;
  @override
  void initState() {
    viewModel = widget.viewModel;
    widget.onBaseReady(viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onBaseDispose != null) widget.onBaseDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onBaseBuilder(context, viewModel);
  }
}
