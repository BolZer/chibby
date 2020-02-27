import 'package:chibby/blocs/blocs.dart';
import 'package:chibby/entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('Monsters Bloc Test', () {
    MockBuildContext mockedContext;
    MonstersBloc monstersBloc;

    setUp(() {
      mockedContext = MockBuildContext();
      monstersBloc = MonstersBloc();
    });

    test('initial state of bloc', () {
      MonstersLoading state = monstersBloc.initialState;

      expect(state is MonstersLoading, true);
      expect(state.version, ChibbyGameVersion.MHW);
    });

    /*blocTest<MonstersBloc, MonstersEvent, MonstersState>(
        "changes state if the loadMonsters event is added",
        build: () => monstersBloc,
        act: (MonstersBloc bloc) async =>
            bloc.add(LoadMonsters(mockedContext, ChibbyGameVersion.MHW)),
        expect: <MonstersState>[MonstersLoading()]);*/
  });
}
