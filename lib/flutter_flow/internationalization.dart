import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'hmyr2odl': {
      'es': 'Pasar a mi siguiente pagina ',
      'en': 'Go to my next page',
    },
    't3jujbw1': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // second_page
  {
    '9ikgoo3g': {
      'es': 'Bienvenido a la segunda pagina ',
      'en': 'Welcome to the second page',
    },
    's3fknkqa': {
      'es': 'Segunda pagina',
      'en': 'Second page',
    },
    'hnhh31iz': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'onzf2x9f': {
      'es': 'Esta aplicacion necesita el permiso  bluetooth',
      'en': '',
    },
    '8t4qa5rk': {
      'es': '',
      'en': '',
    },
    'zfr0h6rj': {
      'es': '',
      'en': '',
    },
    'j1pmty0s': {
      'es': '',
      'en': '',
    },
    '3wy8cyye': {
      'es': '',
      'en': '',
    },
    'z5wv92c0': {
      'es': '',
      'en': '',
    },
    '2hq15fq5': {
      'es': '',
      'en': '',
    },
    'qml5eayf': {
      'es': '',
      'en': '',
    },
    'alaid60k': {
      'es': '',
      'en': '',
    },
    'ls2q22p1': {
      'es': '',
      'en': '',
    },
    'ejrmpkd9': {
      'es': '',
      'en': '',
    },
    'p715hbes': {
      'es': '',
      'en': '',
    },
    'nw60txsu': {
      'es': '',
      'en': '',
    },
    'flphwnsn': {
      'es': '',
      'en': '',
    },
    'pkz8hlje': {
      'es': '',
      'en': '',
    },
    'bhjk89v5': {
      'es': '',
      'en': '',
    },
    'lmol9rqw': {
      'es': '',
      'en': '',
    },
    '30wapocb': {
      'es': '',
      'en': '',
    },
    'c25dndxl': {
      'es': '',
      'en': '',
    },
    '34mmwz7r': {
      'es': '',
      'en': '',
    },
    '3h3nv9jk': {
      'es': '',
      'en': '',
    },
    '8j81vx1x': {
      'es': '',
      'en': '',
    },
    'o0hwmf55': {
      'es': '',
      'en': '',
    },
    '5c2z224w': {
      'es': '',
      'en': '',
    },
    'siu8e3ju': {
      'es': '',
      'en': '',
    },
    'd89j3av6': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
