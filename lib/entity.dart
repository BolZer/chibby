enum ChibbyGameVersion { MHW, MHGU, MH4U }
enum ChibbyLanguageVersion { GERMAN, JAPANESE, ENGLISH }
enum ChibbyThemeVersion { DARK, LIGHT }
enum ChibbyControlOrientation { RIGHT, LEFT }

class Monster {
  String name;
  String game;
  Map<String, dynamic> names;
  Weakness weakness;

  Monster({this.name, this.game, this.names, this.weakness});

  Monster.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    game = json['Game'];
    names = json['Names'];
    weakness = json['Weakness'] != null ? new Weakness.fromJson(json['Weakness']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Game'] = this.game;
    data['Names'] = this.names;
    if (this.weakness != null) {
      data['Weakness'] = this.weakness.toJson();
    }
    return data;
  }
}

class Weakness {
  int fire;
  int water;
  int thunder;
  int ice;
  int dragon;

  Weakness({this.fire, this.water, this.thunder, this.ice, this.dragon});

  Weakness.fromJson(Map<String, dynamic> json) {
    fire = json['Fire'];
    water = json['Water'];
    thunder = json['Thunder'];
    ice = json['Ice'];
    dragon = json['Dragon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fire'] = this.fire;
    data['Water'] = this.water;
    data['Thunder'] = this.thunder;
    data['Ice'] = this.ice;
    data['Dragon'] = this.dragon;
    return data;
  }
}
