import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/ui/settings/model/settings_model.dart';

abstract class SettingsCubit extends Cubit<GenericState> {
  SettingsCubit() : super(Initial());

  List<SettingsItem>? settings;
}

class SettingsCubitImpl extends SettingsCubit {
  final List<SettingsItem> _settings = SettingsItem.values;

  @override
  List<SettingsItem> get settings => _settings;
}
