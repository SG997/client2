import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/log.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    Logger.log("onCreate = $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) Logger.log("onChange = $change");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.log("onTransition = $transition");
  }

  @override
  void onClose(BlocBase bloc) {
    Logger.log("onClose = $bloc");
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.log("onError = $error");
    super.onError(bloc, error, stackTrace);
  }
}
