import 'package:chibby/entity.dart';
import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends SettingsEvent {
  final ChibbyThemeVersion theme;

  const ChangeTheme(this.theme);

  @override
  List<Object> get props => [theme];
}

class ChangeLanguage extends SettingsEvent {
  final ChibbyLanguageVersion language;

  const ChangeLanguage(this.language);

  @override
  List<Object> get props => [language];
}

class ChangeMonsterLanguage extends SettingsEvent {
  final ChibbyLanguageVersion languageMonster;

  const ChangeMonsterLanguage(this.languageMonster);

  @override
  List<Object> get props => [languageMonster];
}