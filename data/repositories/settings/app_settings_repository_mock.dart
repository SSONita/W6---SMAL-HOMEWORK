import 'package:homework/w6/data/repositories/settings/app_settings_repository.dart';
import 'package:homework/w6/model/settings/app_settings.dart';

class AppSettingsRepositoryMock implements AppSettingsRepository {
  AppSettings _default = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(Duration(milliseconds: 300));
    return _default;
  }

  @override
  Future<void> save(AppSettings settings) async {
    await Future.delayed(Duration(milliseconds: 300));
    _default = settings;
  }
}
