import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/l10n_dummy.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/cubit/notification_settings_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/mobil/notification_settings_model.dart';

class NotificationSettingsList extends StatelessWidget {
  const NotificationSettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationCubit = context.read<NotificationSettingsCubit>();
    return StreamBuilder<List<NotificationSettingsItem>>(
      stream: notificationCubit.notificationSettingsList,
      builder: (context, snapshot) {
        final list = snapshot.data ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                title: Label(
                  text: L10nDummy.notificationHeader,
                  size: 12,
                  color: UIColor.black.withOpacity(0.5),
                ),
                subtitle: Label(
                  text: item.type.title ?? "",
                  size: 18,
                  weight: FontWeight.w700,
                  color: UIColor.black,
                ),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: UIColor.ultramarineBlue,
                    value: item.isSelected,
                    onChanged: (value) => notificationCubit.changeSwitchState(item.type),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
