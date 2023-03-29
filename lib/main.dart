import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/app/app.dart';
import 'package:unimastery_mobile/app/app_bloc_observer.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/app/viewmodel/app_view_model.dart';
import 'package:unimastery_mobile/presentation/service/deep_link_service.dart';
import 'package:unimastery_mobile/presentation/ui/home/cubit/home_page_cubit.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = AppBlocObserver();
    // await Firebase.initializeApp();

    Injector.register();

    locator.get<DeepLinkService>().start();
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    return runApp(
      MultiProvider(
        providers: [
          BlocProvider(create: (_) => locator.get<HomePageCubit>()),
          ChangeNotifierProvider(create: (_) => locator.get<AppViewModel>()),
        ],
        child: const App(),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
