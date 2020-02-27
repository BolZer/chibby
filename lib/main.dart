import 'package:chibby/blocs/blocs.dart';
import 'package:chibby/blocs/monsters/monsters_bloc.dart';
import 'package:chibby/blocs/monsters/monsters_events.dart';
import 'package:chibby/blocs/monsters/monsters_states.dart';
import 'package:chibby/config.dart';
import 'package:chibby/entity.dart';
import 'package:chibby/localization.dart';
import 'package:chibby/screens/settings.dart';
import 'package:chibby/widgets/monster_tile.dart';
import 'package:chibby/widgets/non_rounded_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  List<BlocProvider> get _blocProviders {
    return [
      BlocProvider<MonstersBloc>(
        create: (BuildContext context) => MonstersBloc(),
      ),
      BlocProvider<SettingsBloc>(
        create: (BuildContext context) => SettingsBloc(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProviders,
      child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
        return MaterialApp(
          onGenerateTitle: (BuildContext context) =>
              AppLocalization.of(context).title,
          localizationsDelegates: ApplicationConfig.SUPPORTED_DELEGATES,
          locale: state.language == ChibbyLanguageVersion.ENGLISH
              ? Locale('en')
              : Locale('ja'),
          supportedLocales: ApplicationConfig.SUPPORTED_LOCALES,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: state.theme == ChibbyThemeVersion.DARK
                ? Color.fromRGBO(45, 45, 45, 1)
                : Color.fromRGBO(250, 250, 250, 1),
            brightness: state.theme == ChibbyThemeVersion.DARK
                ? Brightness.dark
                : Brightness.light,
          ),
          home: Main(),
        );
      }),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final TextEditingController _controller = TextEditingController();

  MonstersBloc _monstersBloc;
  SettingsBloc _settingsBloc;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  AppBar get _appBar {
    MonstersState state = _monstersBloc.state;

    ChibbyGameVersion version;

    if (state is MonstersLoading) {
      version = state.version;
    }

    if (state is MonstersLoaded) {
      version = state.version;
    }

    return AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _controller.text = "";
                _monstersBloc.add(SearchMonsters("", context, version));
              }),
          NonRoundedRaisedButton(
            child: Text((version).toString().split(".").last),
          )
        ],
        title: Theme(
          data: Theme.of(context).copyWith(
              primaryColor: _settingsBloc.state.theme == ChibbyThemeVersion.DARK
                  ? Colors.tealAccent
                  : Colors.black54),
          child: TextField(
            style: TextStyle(fontSize: 19.0),
            controller: _controller,
            onChanged: (String text) {
              _monstersBloc
                  .add(SearchMonsters(_controller.text, context, version));
            },
            decoration: new InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.search, size: 15.0),
                hintText: AppLocalization.of(context).search),
          ),
        ));
  }

  Widget get _listView {
    MonstersState state = _monstersBloc.state;
    List<Monster> monsters = [];

    if (state is MonstersLoaded) {
      monsters = state.monsters;
    }
    return ListView.builder(
      itemCount: monsters.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: MonsterTile(
                name: monsters[index].names[_settingsBloc.state.languageMonsters
                    .toString()
                    .split(".")
                    .last
                    .toLowerCase()],
                img: Container(
                  constraints: BoxConstraints.tight(Size(0.0, 50.0)),
                  child: Image(
                      loadingBuilder: (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent loadingProgress,
                      ) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      fit: BoxFit.contain,
                      image: AssetImage("assets/monster/" +
                          monsters[index].game +
                          "/" +
                          monsters[index].name.replaceAll(" ", "_") +
                          ".png")),
                ),
                weakness: monsters[index].weakness,
              ),
            ),
            Divider(thickness: 1.5, height: 20.0),
            (index + 1) == monsters.length ? SizedBox(height: 80) : SizedBox(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _monstersBloc = BlocProvider.of<MonstersBloc>(context);
    _settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return BlocBuilder<MonstersBloc, MonstersState>(
        builder: (BuildContext context, MonstersState state) {
      if (state is MonstersLoading) {
        _monstersBloc.add(LoadMonsters(context, state.version));
      }

      return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            foregroundColor: Theme.of(context).primaryTextTheme.button.color,
            child: Icon(FontAwesomeIcons.cog),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
          appBar: _appBar,
          body: state is MonstersLoaded
              ? _listView
              : Center(child: CircularProgressIndicator()));
    });
  }
}
