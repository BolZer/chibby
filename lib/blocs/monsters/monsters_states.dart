import 'package:chibby/entity.dart';
import 'package:equatable/equatable.dart';

abstract class MonstersState extends Equatable {
  const MonstersState();

  @override
  List<Object> get props => [];
}

class MonstersLoading extends MonstersState {
  final ChibbyGameVersion version = ChibbyGameVersion.MHW;

  const MonstersLoading();

  @override
  List<Object> get props => [version];
}

class MonstersLoaded extends MonstersState {
  final ChibbyGameVersion version;
  final List<Monster> monsters;

  const MonstersLoaded(this.monsters, this.version);

  @override
  List<Object> get props => [monsters, version];

  @override
  String toString() => 'MonstersLoaded { monsters: $monsters, version: $version}';
}