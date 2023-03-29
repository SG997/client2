part of 'navigation.dart';

enum RouteName {
  login('login'),
  otp('otp'),
  userDetailInput('userDetailInput'),
  root('root'),
  createAcademy('createAcademy'),
  sessionCreation('sessionCreation'),
  coursePage('coursePage'),
  courseChat('courseChat'),
  about('about'),
  settings('settings'),
  personalInformation('personalInformation'),
  paymentHistory('paymentHistory'),
  none('none'),
  academyPage("academyPage"),
  homePage("homePage"),
  notificationSettings("notification-setting"),
  preSaleCoursePage("preSaleCoursePage"),
  fullScreenImage("fullScreenImage"),
  sessionPage("sessionPage"),
  videoPlayerScreen("videoPlayerScreen"),
  useEditor("editPersonalInformation");

  const RouteName(this.route);

  final String route;

  static RouteName? fromString(String? route) {
    return RouteName.values.firstWhere((element) => element.route == route);
  }
}
