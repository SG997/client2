import 'package:flutter/cupertino.dart';

enum AppState {
  authorized,
  unauthorized,
  loading,
}

abstract class AppViewModel extends ChangeNotifier {
  AppViewModel() {
    check();
  }
  AppState get appState;
  check();
}

class AppViewModelImpl extends AppViewModel {
  AppState _appState = AppState.loading;

  @override
  AppState get appState => _appState;

  @override
  check() async {
    await Future.delayed(const Duration(seconds: 2));
    _appState = AppState.unauthorized;
    notifyListeners();
  }
}
