import 'package:chibby/blocs/blocs.dart';
import 'package:chibby/entity.dart';
import 'package:chibby/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameSelectionDialog extends StatefulWidget {
  GameSelectionDialog({Key key}) : super(key: key);

  @override
  _GameSelectionDialogState createState() => _GameSelectionDialogState();
}

class _GameSelectionDialogState extends State<GameSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    final monsterBloc = BlocProvider.of<MonstersBloc>(context);

    return BlocBuilder<MonstersBloc, MonstersState>(builder: (BuildContext context, MonstersState state) {
      ChibbyGameVersion stateVersion;

      if (state is MonstersLoading) {
        stateVersion = state.version;
      }

      if (state is MonstersLoaded) {
        stateVersion = state.version;
      }

      return AlertDialog(
          title: Center(
            child: Text(AppLocalization.of(context).selectVersion),
          ),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: ChibbyGameVersion.values.map((ChibbyGameVersion version) {
                return RadioListTile(
                  title: Text(getTranslatedVersion(version)),
                  value: version,
                  groupValue: stateVersion,
                  onChanged: (ChibbyGameVersion value) {
                    monsterBloc.add(LoadMonsters(context, value));
                  },
                );
              }).toList()));
    });
  }

  // ignore: missing_return
  String getTranslatedVersion(ChibbyGameVersion version) {
    if (version == ChibbyGameVersion.MHW) {
      return AppLocalization.of(context).mhw;
    }

    if (version == ChibbyGameVersion.MH4U) {
      return AppLocalization.of(context).mh4u;
    }

    if (version == ChibbyGameVersion.MHGU) {
      return AppLocalization.of(context).mhg;
    }
  }
}
