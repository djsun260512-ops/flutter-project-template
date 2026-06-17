// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Flutter-Project-Template';

  @override
  String get login => '登录';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String loginFailed(Object error) {
    return '登录失败：$error';
  }

  @override
  String get home => '首页';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get themeSystem => '跟随系统';
}
