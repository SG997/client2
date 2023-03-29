import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';

class GenericListener<B extends StateStreamable<S>, S> extends BlocListener<B, S> {
  const GenericListener({
    Key? key,
    required BlocWidgetListener<S> listener,
    Widget? child,
  }) : super(key: key, listener: listener, child: child);

  @override
  BlocWidgetListener<S> get listener {
    return (context, state) {
      super.listener(context, state);

      if (state is Failure) {}
    };
  }
}
