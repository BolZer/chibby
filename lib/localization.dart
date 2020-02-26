import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static AppLocalization load(Locale locale) {
    return AppLocalization(locale);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Chibby',
      'search': 'Search...',
      'theme': 'Theme',
      'application_language': 'Application Language',
      'monster_language': 'Monster Language',
      'control_orientation': 'Control Orientation',
      'MHW': 'MHW',
      'MHG': 'MHGU',
      'MH4U': 'MH4U',
      'select_version': 'Select Version',
      'dark': 'Dark',
      'light': 'Light',
      'japanese': 'Japanese',
      'english': 'English',
      'right': 'Right',
      'left': 'Left',
      'version': 'Version',
      'license': 'License',
      'developer': 'Developer',
      'repository': 'Repository'
    },
    'ja': {
      'title': 'チビー',
      'search': '探す...',
      'theme': 'テーマ',
      'application_language': '応用 言語',
      'monster_language': 'モンスター 言語',
      'control_orientation': '方向を制御する',
      'MHW': 'MHW',
      'MHG': 'MHXX',
      'MH4U': 'MH4G',
      'select_version': 'バージョンを選択',
      'dark': '闇',
      'light': '光',
      'japanese': '日本語',
      'english': '英語',
      'right': '正しい',
      'left': '左',
      'version': 'バージョン',
      'license': 'ライセンス',
      'developer': '開発者',
      'repository': 'リポジトリ'
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get search {
    return _localizedValues[locale.languageCode]['search'];
  }

  String get monsterLanguage {
    return _localizedValues[locale.languageCode]['monster_language'];
  }

  String get applicationLanguage {
    return _localizedValues[locale.languageCode]['application_language'];
  }

  String get theme {
    return _localizedValues[locale.languageCode]['theme'];
  }

  String get controlOrientation {
    return _localizedValues[locale.languageCode]['control_orientation'];
  }

  String get mhw {
    return _localizedValues[locale.languageCode]['MHW'];
  }

  String get mhg {
    return _localizedValues[locale.languageCode]['MHG'];
  }

  String get mh4u {
    return _localizedValues[locale.languageCode]['MH4U'];
  }

  String get selectVersion {
    return _localizedValues[locale.languageCode]['select_version'];
  }

  String get dark {
    return _localizedValues[locale.languageCode]['dark'];
  }

  String get light {
    return _localizedValues[locale.languageCode]['light'];
  }

  String get japanese {
    return _localizedValues[locale.languageCode]['japanese'];
  }

  String get english {
    return _localizedValues[locale.languageCode]['english'];
  }

  String get right {
    return _localizedValues[locale.languageCode]['right'];
  }

  String get left {
    return _localizedValues[locale.languageCode]['left'];
  }

  String get version {
    return _localizedValues[locale.languageCode]['version'];
  }

  String get developer {
    return _localizedValues[locale.languageCode]['developer'];
  }

  String get license {
    return _localizedValues[locale.languageCode]['license'];
  }

  String get repository {
    return _localizedValues[locale.languageCode]['repository'];
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
