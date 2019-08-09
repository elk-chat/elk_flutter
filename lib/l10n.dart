import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'l10n/messages_all.dart';

const LocaleList = ['zh', 'en'];

class L10n {
  static Future<L10n> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return L10n();
    });
  }

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  String get appTitle {
    return Intl.message(
      'kChat',
      name: 'appTitle',
      desc: 'app标题',
    );
  }
}

class L10nLocalizationsDelegate extends LocalizationsDelegate<L10n> {
  const L10nLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return LocaleList.contains(locale.languageCode);
  }

  @override
  Future<L10n> load(Locale locale) {
    return L10n.load(locale);
  }

  @override
  bool shouldReload(L10nLocalizationsDelegate old) => false;
}
