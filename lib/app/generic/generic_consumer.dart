import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';

class GenericConsumer<B extends StateStreamable<S>, S> extends BlocConsumer<B, S> {
  const GenericConsumer({
    Key? key,
    required BlocWidgetBuilder<S> builder,
    required BlocWidgetListener<S> listener,
  }) : super(
          key: key,
          builder: builder,
          listener: listener,
        );

  @override
  BlocWidgetBuilder<S> get builder {
    return (context, state) {
      if (state is InProgress) {
        return const Center(child: LoadingIndicator());
      }

      return super.builder(context, state);
    };
  }

  @override
  BlocWidgetListener<S> get listener {
    return (context, state) {
      if (state is Failure) {}

      return super.listener(context, state);
    };
  }
}
