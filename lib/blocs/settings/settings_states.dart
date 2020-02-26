import 'package:chibby/entity.dart';
import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  final ChibbyThemeVersion theme;
  final ChibbyLanguageVersion language;
  final ChibbyLanguageVersion languageMonsters;

  const SettingsState(this.theme, this.language, this.languageMonsters);

  @override
  List<Object> get props => [theme, language, languageMonsters];
}

class Default extends SettingsState {

  const Default() : super(ChibbyThemeVersion.DARK, ChibbyLanguageVersion.ENGLISH, ChibbyLanguageVersion.ENGLISH);

  @override
  List<Object> get props => [theme, language, languageMonsters];
}

class SettingsSaved extends SettingsState {
  final ChibbyThemeVersion theme;
  final ChibbyLanguageVersion language;
  final ChibbyLanguageVersion languageMonsters;

  const SettingsSaved(this.theme, this.language, this.languageMonsters) : super(theme, language, languageMonsters);

  @override
  List<Object> get props => [theme, language, languageMonsters];
}