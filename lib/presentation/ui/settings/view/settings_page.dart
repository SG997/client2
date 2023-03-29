import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/app-bar/primary_app_bar.dart';
import 'package:unimastery_mobile/presentation/ui/settings/view/settings_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: const SettingsBody(),
    );
  }
}
