import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/view/notification_settings_list.dart';

class NotificationSettingsBody extends StatelessWidget {
  const NotificationSettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Space(height: 32),
          Label(
            text: "Notification Center",
            size: 23,
            color: UIColor.black,
            weight: FontWeight.w700,
          ),
          Space(height: 24),
          NotificationSettingsList(),
        ],
      ),
    );
  }
}
