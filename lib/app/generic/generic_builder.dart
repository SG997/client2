import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';

class GenericBuilder<B extends StateStreamable<S>, S> extends BlocBuilder<B, S> {
  const GenericBuilder({
    Key? key,
    required BlocWidgetBuilder<S> builder,
  }) : super(key: key, builder: builder);

  @override
  BlocWidgetBuilder<S> get builder {
    return (context, state) {
      if (state is InProgress) {
        return const Center(child: LoadingIndicator());
      }

      return super.builder(context, state);
    };
  }
}
