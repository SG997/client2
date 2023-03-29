enum NotificationSettingsType {
  message("Getting direct message from a mentor"),
  sessionUpload("New Session upload"),
  contentUpload("New content is uploaded"),
  contentSave("Saved content have better prices");

  final String? title;

  const NotificationSettingsType(
    this.title,
  );
}

class NotificationSettingsItem {
  final NotificationSettingsType type;
  bool isSelected;

  NotificationSettingsItem({
    required this.type,
    this.isSelected = false,
  });
}
