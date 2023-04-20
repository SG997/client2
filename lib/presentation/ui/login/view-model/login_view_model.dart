import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:retrofit/http.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';

import '../../../../data/rest_api.dart';
import 'dart:developer';

abstract class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isKeyboardVisible = false;
  String? phoneNumberError;
  String? phoneNumber;

  void setPhoneNumber(String value);

  Future login();
}

class LoginViewModelImpl extends LoginViewModel {
  bool _isKeyboardVisible = false;
  bool _isLoading = false;
  String? _phoneNumberError;
  String? _phoneNumber;

  StreamSubscription<bool>? keyboardSubscription;

  LoginViewModelImpl() {
    listenKeyboardVisibility();
  }

  @override
  bool get isLoading => _isLoading;

  @override
  bool get isKeyboardVisible => _isKeyboardVisible;

  @override
  String? get phoneNumberError => _phoneNumberError;

  @override
  setPhoneNumber(String value) => _phoneNumber = value;

  @override
  login() async {
    setLoading(true);

    final String? phoneNumber = _phoneNumber;

    if (phoneNumber == null || phoneNumber.isEmpty) {
      _phoneNumberError = "Phone number is required";
      setLoading(false);
      return;
    }

    RestClient.getApi(isAuth: false).sendOtp('+972' + phoneNumber).then((value) => {
      setLoading(false),
      Navigation.push(RouteName.otp, arguments: '+972' + phoneNumber)
    }).catchError((onError) => {
      // TODO handle error
      log('data: onError'),
      setLoading(false)

    });


    //await Future.delayed(const Duration(seconds: 1));

  }

  listenKeyboardVisibility() {
    keyboardSubscription = KeyboardVisibilityController().onChange.listen((isVisible) {
      _isKeyboardVisible = isVisible;
      notifyListeners();
    });
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    keyboardSubscription?.cancel();
    super.dispose();
  }
}
