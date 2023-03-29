import 'package:unimastery_mobile/presentation/router/navigation.dart';

enum SettingsItem {
  personalInformation("Personal Information", RouteName.personalInformation),
  paymentHistory("Payment History", RouteName.paymentHistory),
  notifications("Notifications", RouteName.notificationSettings),
  createAcademy("Create Academy", RouteName.createAcademy);

  final String text;
  final RouteName routeName;

  const SettingsItem(this.text, this.routeName);
}
