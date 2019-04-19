import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ninghao/demo/i18n/map/localizations_map_demo.dart';
import '../../generated/i18n.dart';

///国际化
class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Text('${locale.languageCode}'),
            Text('${locale.toString()}'),
            Text(
//              Localizations.of(context, LocalizationsDemo).title,

              LocalizationsMapDemo.of(context).title,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              S.of(context).greet,
            )
          ],
        ),
      ),
    );
  }
}
