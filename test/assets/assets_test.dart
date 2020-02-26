import 'dart:convert';
import 'dart:io';

import 'package:chibby/entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Assets Tests", () {
    test("Check if launcher icon is in the assets folder", () async {
      var file = File('../assets/icon.png');
      expect(await file.exists(), true);
    });

    test("Check if the monsters json is at the right place / exists", () async {
      var file = File('../assets/monsters.json');
      expect(await file.exists(), true);
    });

    test("Check if every monster in json has image in asset bundle", () async {
      var file = File('../assets/monsters.json');

      List<Monster> monsters = [];

      var rawMonstersDataDecoded = json.decode(file.readAsStringSync());

      rawMonstersDataDecoded.forEach((value) {
        monsters.add(Monster.fromJson(value));
      });

      monsters.forEach((Monster monster) async {
        var toBeCheckFile = File("../assets/monster/" + monster.game.toString().split(".").last.toLowerCase() + "/" + monster.name.replaceAll(" ", "_") + ".png");
        expect(await toBeCheckFile.exists(), true);
      });
    });
  });
}
