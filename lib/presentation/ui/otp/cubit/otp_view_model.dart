import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:unimastery_mobile/data/data-model/verify_otp.dart';
import 'package:unimastery_mobile/data/cache.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';

import '../../../../data/data-model/authenticate/authenticate.dart';
import '../../../../data/data-model/user/user-entity.dart';
import '../../../../data/rest_api.dart';
import '../../../../data/share_prefrences/shared_prefrences.dart';

abstract class OtpViewModel extends ChangeNotifier {
  bool? isNextButtonActive;
  late bool isLoading;

  void setPin(String? value);
  void setPhoneNumber(String phoneNumber);
  Future<void> confirm();
}

class OtpViewModelImpl extends OtpViewModel {
  bool? _isNextButtonActive;
  bool _isLoading = false;
  String? _pin;
  String? _phoneNumber;

  @override
  bool? get isNextButtonActive => _isNextButtonActive;

  @override
  bool get isLoading => _isLoading;

  @override
  void setPin(String? value) async {
    _pin = value;

    if (value == null || value.length < 6) return;

    confirm();
  }

  @override
  confirm() async {
    final String? pin = _pin;

    if (pin == null) return;

    setLoading(true);

    verifyOtp(_phoneNumber!, pin);
    //await Future.delayed(const Duration(seconds: 1));
  }

  verifyOtp(String phoneNumber, String pin) async {

    DateTime.parse('1974-03-20 00:00:00.000');

    RestClient.getApi(isAuth: false).verifyingOtp(new VerifyingOtp(phoneNumber, pin)).then((value) => {
      populate(value),
      onOtpVerifyCompleteLogic(value.user)
    }).catchError((onError) => {
      // TODO show dialog
      setLoading(false)
    });
  }

  populate(AuthenticateVM authenticate) {
    SharedPrefrences.saveToken(authenticate.token);

    Cache.user = authenticate.user;
    Cache.token = authenticate.token;
  }

  onOtpVerifyCompleteLogic(UserEntity user) {

    switch (user.userStatus) {
      case UserStatus.OTP:
        setLoading(false);
        Navigation.push(RouteName.userDetailInput);
        break;
      case UserStatus.ACTIVE:
        Navigation.popToRootAndPushNamed(RouteName.root);
        break;
    }



  }



  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @override
  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
}
