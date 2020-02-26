import 'package:chibby/entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MonstersEvent extends Equatable {
  const MonstersEvent();

  @override
  List<Object> get props => [];
}

class LoadMonsters extends MonstersEvent {
  final BuildContext context;
  final ChibbyGameVersion version;

  const LoadMonsters(this.context, this.version);

  @override
  List<Object> get props => [context, version];
}

class SearchMonsters extends MonstersEvent {
  final BuildContext context;
  final String query;
  final ChibbyGameVersion version;

  const SearchMonsters(this.query, this.context, this.version);

  @override
  List<Object> get props => [query, context, version];
}
