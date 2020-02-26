import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  /*group('ChibbyBloc Tests', () {

    MockBuildContext mockedContext;
    ChibbyBloc chibbyBloc;

    setUp(() {
      mockedContext = MockBuildContext();
      chibbyBloc = ChibbyBloc();
    });

    test('initial state of bloc', () {
      var state = chibbyBloc.initialState;

      expect(state is Ready, true);
      expect(state.version, ChibbyGameVersion.MHW);
      expect(state.monsters, []);
      expect(state.applicationContext, null);
    });

    blocTest<ChibbyBloc, ChibbyEvent, ChibbyState>(
        "changes state if the initialize event is added",
        build: () => chibbyBloc,
        act: (ChibbyBloc bloc) async => bloc.add(Initialize(mockedContext)),
        expect: <ChibbyState>[
          Ready(),
          Initialized(),
        ]
    );

    blocTest<ChibbyBloc, ChibbyEvent, ChibbyState>(
        "changes game version to mhgu if ChangeGameVersion Event is added",
        build: () => chibbyBloc,
        act: (ChibbyBloc bloc) async => bloc.add(ChangeGameVersion(ChibbyGameVersion.MHGU)),
        expect: <ChibbyState>[
          GameVersionChanged(),
          MonsterDataLoading(),
          MonsterDataLoaded(),
        ]
    );
  });*/
}
