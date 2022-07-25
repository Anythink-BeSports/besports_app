enum SettingTypes {
  notification,
  userInfor,
  etc
}

class Setting {
  final String title;
  final SettingTypes settingTypes;

  const Setting({
    required this.title,
    required this.settingTypes,
  });
}
