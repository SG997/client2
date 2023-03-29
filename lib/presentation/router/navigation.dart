import 'package:flutter/material.dart';

part 'route_name.dart';

class Navigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentState!.context;

  static push(RouteName routeName, {dynamic arguments}) async {
    return await navigatorKey.currentState?.pushNamed(
      routeName.route,
      arguments: arguments,
    );
  }

  static pushReplacement(RouteName routeName, {dynamic arguments}) async {
    return await navigatorKey.currentState?.pushReplacementNamed(
      routeName.route,
      arguments: arguments,
    );
  }

  static pushNamedAndRemoveUntil(RouteName routeName, {dynamic arguments}) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName.route,
      (route) => route.isFirst,
      arguments: arguments,
    );
  }

  static popToRootAndPushNamed(RouteName routeName, {dynamic arguments}) async {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
    return await pushReplacement(routeName, arguments: arguments);
  }

  static pop<T>({T? result}) {
    if (canPop) navigatorKey.currentState?.pop(result);
  }

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;
}
