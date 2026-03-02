import 'package:flutter/widgets.dart';
import 'package:homework/w6/data/repositories/settings/app_settings_repository.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingsRepository appSettingsRepository;

  AppSettings? _appSettings;

  AppSettingsState(this.appSettingsRepository);

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await appSettingsRepository.load();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    await appSettingsRepository.save(_appSettings!);
    notifyListeners();
  }
}
