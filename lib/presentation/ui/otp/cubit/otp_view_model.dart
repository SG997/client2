import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';

abstract class OtpViewModel extends ChangeNotifier {
  bool? isNextButtonActive;
  late bool isLoading;

  void setPin(String? value);
  Future<void> confirm();
}

class OtpViewModelImpl extends OtpViewModel {
  bool? _isNextButtonActive;
  bool _isLoading = false;
  String? _pin;

  @override
  bool? get isNextButtonActive => _isNextButtonActive;

  @override
  bool get isLoading => _isLoading;

  @override
  void setPin(String? value) async {
    _pin = value;

    if (value == null || value.length < 4) return;

    confirm();
  }

  @override
  confirm() async {
    final String? pin = _pin;

    if (pin == null) return;

    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    setLoading(false);

    Navigation.push(RouteName.userDetailInput);
  }

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
