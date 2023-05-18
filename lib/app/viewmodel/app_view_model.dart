import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:unimastery_mobile/data/cache.dart';

import '../../data/rest_api.dart';
import '../../data/share_prefrences/shared_prefrences.dart';
import '../../presentation/router/navigation.dart';
import '../../presentation/util/strings_utils.dart';

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

    String? token = await SharedPrefrences.getToken();

    if (!StringUtils.isNullOrEmpty(token)) {
      Cache.token = token!;
      await RestClient.getApi().getHome();
      _appState = AppState.authorized;
      //Navigation.popToRootAndPushNamed(RouteName.root);

    } else {
      _appState = AppState.unauthorized;
    }


    //await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }


}
