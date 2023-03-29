import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/mobil/notification_settings_model.dart';

abstract class NotificationSettingsCubit extends Cubit<GenericState> {
  NotificationSettingsCubit() : super(Initial());

  Stream<List<NotificationSettingsItem>>? notificationSettingsList;

  void changeSwitchState(NotificationSettingsType type);
}

class NotificationSettingsCubitImpl extends NotificationSettingsCubit {
  final notificationsList = BehaviorSubject<List<NotificationSettingsItem>>.seeded(
    [
      NotificationSettingsItem(type: NotificationSettingsType.message),
      NotificationSettingsItem(type: NotificationSettingsType.sessionUpload),
      NotificationSettingsItem(type: NotificationSettingsType.contentUpload),
      NotificationSettingsItem(type: NotificationSettingsType.contentSave),
    ],
  );

  @override
  Stream<List<NotificationSettingsItem>>? get notificationSettingsList => notificationsList.stream;

  @override
  void changeSwitchState(NotificationSettingsType type) {
    final list = notificationsList.value;
    final item = list.firstWhere((element) => element.type == type);
    item.isSelected = !item.isSelected;
    notificationsList.add(list);
  }

  @override
  Future<void> close() {
    notificationsList.close();
    return super.close();
  }
}
