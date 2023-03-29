import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/app/viewmodel/app_view_model.dart';
import 'package:unimastery_mobile/presentation/components/navbar/primary_bottom_navbar_controller.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/router/route_generator.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/login/view-model/login_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/login/view/login_page.dart';
import 'package:unimastery_mobile/presentation/ui/root/root_page.dart';
import 'package:unimastery_mobile/presentation/ui/splash/splash_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AppViewModel>();
    final state = viewModel.appState;
    return MaterialApp(
      title: 'UniMastery',
      theme: UITheme.appTheme,
      navigatorKey: Navigation.navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: state == AppState.authorized
          ? RootPage(controller: PrimaryBottomNavbarController())
          : state == AppState.unauthorized
              ? ChangeNotifierProvider(
                  create: (_) => locator.get<LoginViewModel>(),
                  child: const LoginPage(),
                )
              : const SplashPage(),
    );
  }
}
