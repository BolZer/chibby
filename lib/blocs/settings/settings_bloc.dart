import 'package:bloc/bloc.dart';
import 'package:chibby/blocs/blocs.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState => Default();

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ChangeTheme) {
      yield SettingsSaved(event.theme, state.language, state.languageMonsters);
    }

    if (event is ChangeLanguage) {
      yield SettingsSaved(state.theme, event.language, state.languageMonsters);
    }

    if (event is ChangeMonsterLanguage) {
      yield SettingsSaved(state.theme, state.language, event.languageMonster);
    }
  }
}
