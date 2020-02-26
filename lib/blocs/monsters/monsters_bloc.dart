import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chibby/blocs/monsters/monsters_events.dart';
import 'package:chibby/blocs/monsters/monsters_states.dart';
import 'package:chibby/entity.dart';
import 'package:flutter/cupertino.dart';

class MonstersBloc extends Bloc<MonstersEvent, MonstersState> {
  @override
  MonstersState get initialState => MonstersLoading();

  Future<List<Monster>> _loadMonsterData(BuildContext context, ChibbyGameVersion version) async {
    if (context == null) {
      throw new Exception("context may not be null");
    }

    List<Monster> monsters = [];

    var rawMonstersDataDecoded = json.decode(await DefaultAssetBundle.of(context).loadString("assets/monsters.json"));

    rawMonstersDataDecoded.forEach((value) {
      monsters.add(Monster.fromJson(value));
    });

    List<Monster> filteredMonsters = monsters.where((Monster monster) {
      return monster.game == version.toString().split(".").last.toLowerCase();
    }).toList();

    filteredMonsters.sort((Monster a, Monster b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    return filteredMonsters;
  }

  @override
  Stream<MonstersState> mapEventToState(MonstersEvent event) async* {
    if (event is LoadMonsters) {
      yield MonstersLoaded(await _loadMonsterData(event.context, event.version), event.version);
    }

    if (event is SearchMonsters) {
      List<Monster> monsters = await _loadMonsterData(event.context, event.version);

      List<Monster> queriedMonsters = monsters.where((Monster monster) {
        return
          monster.names[ChibbyLanguageVersion.ENGLISH.toString().split(".").last.toLowerCase()].toLowerCase().contains(event.query.toLowerCase()) ||
          monster.names[ChibbyLanguageVersion.JAPANESE.toString().split(".").last.toLowerCase()].toLowerCase().contains(event.query.toLowerCase());
      }).toList();

      yield MonstersLoaded(queriedMonsters, event.version);
    }
  }
}
