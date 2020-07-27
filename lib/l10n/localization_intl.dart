import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //1

///生成arb文件:flutter pub pub run intl_translation:extract_to_arb --output-dir=l10n-arb \ lib/l10n/localization_intl.dart
///生成dart代码:flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/l10n/localization_intl.dart l10n-arb/intl_*.arb
class IntlDemoLocalizations {
  static Future<IntlDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //2
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return new IntlDemoLocalizations();
    });
  }

  static IntlDemoLocalizations of(BuildContext context) {
    return Localizations.of<IntlDemoLocalizations>(
        context, IntlDemoLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  remainingEmailsMessage(int howMany) => Intl.plural(howMany,
      zero: 'There are no emails left',
      one: 'There is $howMany email left',
      other: 'There are $howMany emails left',
      name: "remainingEmailsMessage",
      args: [howMany],
      desc: "How many emails remain after archiving.",
      examples: const {'howMany': 42, 'userName': 'Fred'});
}

//Locale代理类
class IntlDemoLocalizationsDelegate
    extends LocalizationsDelegate<IntlDemoLocalizations> {
  const IntlDemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<IntlDemoLocalizations> load(Locale locale) {
    //3
    return IntlDemoLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(IntlDemoLocalizationsDelegate old) => false;
}
