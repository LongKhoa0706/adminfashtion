
import 'package:adminfashtion/src/core/viewmodel/baseviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {

  late final Widget Function(BuildContext context, T? model, Widget? child) builder;
  final T? model;
  final Widget? child;
  final Function(T)? onModelReady;

  BaseView({Key? key, this.model, required this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    print(widget.model!);
    model = widget.model!;
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
      create: (BuildContext context) {
        return model;
      },
    );
  }
}