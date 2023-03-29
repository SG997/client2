import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/ui/settings/cubit/settings_cubit.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    final settings = cubit.settings ?? [];
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final item = settings[index];
          return Column(
            children: [
              ListTile(
                leading: Label(text: item.text, size: 18),
                trailing: const Icon(CupertinoIcons.right_chevron),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                onTap: () => Navigation.push(item.routeName),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
