import 'package:chibby/blocs/blocs.dart';
import 'package:chibby/config.dart';
import 'package:chibby/entity.dart';
import 'package:chibby/localization.dart';
import 'package:chibby/widgets/form_dropdown_selection_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget _createSettingForm(SettingsBloc settingsBloc, SettingsState state) {
    return ListView(
      children: <Widget>[
        FormDropdownSelectionField(
          inputDecoration: InputDecoration(filled: false, prefixIcon: Icon(FontAwesomeIcons.globeAsia), labelText: AppLocalization.of(context).applicationLanguage),
          onChanged: (value) {
            settingsBloc.add(ChangeLanguage(value as ChibbyLanguageVersion));
          },
          value: state.language,
          items: ApplicationConfig.SUPPORTED_LANGUAGES.map((ChibbyLanguageVersion language) {
            return DropdownMenuItem(
              child: Text(_getTranslatedLanguage(language)),
              value: language,
            );
          }).toList(),
        ),
        FormDropdownSelectionField(
          inputDecoration: InputDecoration(filled: false, prefixIcon: Icon(FontAwesomeIcons.globeEurope), labelText: AppLocalization.of(context).monsterLanguage),
          onChanged: (value) {
            settingsBloc.add(ChangeMonsterLanguage(value as ChibbyLanguageVersion));
          },
          value: state.languageMonsters,
          items: ApplicationConfig.SUPPORTED_LANGUAGES.map((ChibbyLanguageVersion language) {
            return DropdownMenuItem(
              child: Text(_getTranslatedLanguage(language)),
              value: language,
            );
          }).toList(),
        ),
        FormDropdownSelectionField(
          inputDecoration: InputDecoration(filled: false, prefixIcon: Icon(FontAwesomeIcons.tint), labelText: AppLocalization.of(context).theme),
          onChanged: (value) {
            settingsBloc.add(ChangeTheme(value as ChibbyThemeVersion));
          },
          value: state.theme,
          items: ApplicationConfig.SUPPORTED_THEMES.map((ChibbyThemeVersion theme) {
            return DropdownMenuItem(
              child: Text(_getTranslatedTheme(theme)),
              value: theme,
            );
          }).toList(),
        ),
      ],
    );
  }

  String _getTranslatedTheme(ChibbyThemeVersion theme) {
    if (theme == ChibbyThemeVersion.DARK) {
      return AppLocalization.of(context).dark;
    }

    if (theme == ChibbyThemeVersion.LIGHT) {
      return AppLocalization.of(context).light;
    }
  }

  String _getTranslatedLanguage(ChibbyLanguageVersion language) {
    if (language == ChibbyLanguageVersion.JAPANESE) {
      return AppLocalization.of(context).japanese;
    }

    if (language == ChibbyLanguageVersion.ENGLISH) {
      return AppLocalization.of(context).english;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(builder: (BuildContext context, SettingsState state) {
      final settingsBloc = BlocProvider.of<SettingsBloc>(context);

      return Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(flex: 9, child: _createSettingForm(settingsBloc, state)),
                Divider(thickness: 1.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[Text(AppLocalization.of(context).title + "™" + " - " + "BolZer " + " © " + DateTime.now().year.toString(), style: TextStyle(fontSize: 16.0))],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.githubAlt),
                            onPressed: () {
                              launch('https://github.com/BolZer');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.codeBranch),
                            onPressed: () {
                              launch('https://github.com/BolZer/flutter-mhchibby');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ));
    });
  }
}
