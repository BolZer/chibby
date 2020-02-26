
import 'package:chibby/entity.dart';
import 'package:chibby/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ApplicationConfig {

  static const LIGHT_THEME = ChibbyThemeVersion.LIGHT;
  static const DARK_THEME = ChibbyThemeVersion.DARK;

  static const List<ChibbyThemeVersion> SUPPORTED_THEMES = [
    LIGHT_THEME,
    DARK_THEME,
  ];

  static const ENGLISH_LANGUAGE = ChibbyLanguageVersion.ENGLISH;
  static const JAPANESE_LANGUAGE = ChibbyLanguageVersion.JAPANESE;

  static const List<ChibbyLanguageVersion> SUPPORTED_LANGUAGES = [
    ENGLISH_LANGUAGE,
    JAPANESE_LANGUAGE
  ];

  static const List<Locale> SUPPORTED_LOCALES = [
    Locale('en'),
    Locale('ja'),
  ];

  static const List<LocalizationsDelegate> SUPPORTED_DELEGATES = [
    AppLocalizationDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
}