import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///定义本地化资源类
class LocalizationsMapDemo {
  final Locale locale;
  LocalizationsMapDemo(this.locale);

  static LocalizationsMapDemo of(BuildContext context) {
    return Localizations.of<LocalizationsMapDemo>(context, LocalizationsMapDemo);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '你好',
    }
  };
  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class LocalizationsDemoDelegate extends LocalizationsDelegate<LocalizationsMapDemo> {
  LocalizationsDemoDelegate();

  @override
  Future<LocalizationsMapDemo> load(Locale locale) {
    return SynchronousFuture<LocalizationsMapDemo>(LocalizationsMapDemo(locale));
  }

  ///是否支持本地化语言
  @override
  bool isSupported(Locale locale) {
    return true;
  }

  ///true的场合，会重建小部件
  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsMapDemo> old) {
    return false;
  }
}
