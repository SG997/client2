import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/app-bar/primary_app_bar.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/view/notification_settings_body.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: const NotificationSettingsBody(),
    );
  }
}
