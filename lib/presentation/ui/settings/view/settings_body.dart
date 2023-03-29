import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/ui/settings/view/settings_bottom_item.dart';
import 'package:unimastery_mobile/presentation/ui/settings/view/settings_list.dart';
import 'package:unimastery_mobile/presentation/ui/settings/view/settings_profile.dart';
import 'package:unimastery_mobile/presentation/ui/settings/view/settings_top_item.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          SettingsTopItem(),
          SettingsProfile(),
          SettingsList(),
          SettingsBottomItem(),
        ],
      ),
    );
  }
}
