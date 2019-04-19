import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///定义需要翻译的信息
/// dart文件生成arb文件命令
/// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/demo/i18n/intl/ lib/demo/i18n/intl/localizations_intl_demo.dart
///
/// arb文件生成dart文件命令
/// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/localizations_intl_demo.dart lib/demo/i18n/intl/intl_*.arb
/// flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=demo_ --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/localizations_intl_demo.dart lib/demo/i18n/intl/intl_zh.arb lib/demo/i18n/intl/intl_en.arb
class LocalizationsIntlDemo {
  String get title => Intl.message(
        'hello',
        name: 'title',
        desc: 'demo localizations.',
      );

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone.',
        args: [name],
      );
}
