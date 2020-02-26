import 'dart:math';

import 'package:chibby/entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MonsterTile extends StatefulWidget {
  final String name;
  final Widget img;
  final Weakness weakness;

  MonsterTile({Key key, @required this.name, @required this.img, @required this.weakness}) : super(key: key);

  @override
  _MonsterTileState createState() => _MonsterTileState();
}

class _MonsterTileState extends State<MonsterTile> {
  List<Widget> _getMonsterWeaknessAsSimpleIndicator(int value) {

    if (value == 0) {
      return [Icon(FontAwesomeIcons.times, size: 8.0)];
    }

    List<int> weakness = [widget.weakness.fire, widget.weakness.thunder, widget.weakness.ice, widget.weakness.water, widget.weakness.dragon];

    weakness.remove(0);

    if (value == weakness.reduce(max)){
      return [Icon(FontAwesomeIcons.solidStar, size: 8.0), Icon(FontAwesomeIcons.solidStar, size: 8.0), Icon(FontAwesomeIcons.solidStar, size: 8.0)];
    }

    if (value == weakness.reduce(min)){
      return [Icon(FontAwesomeIcons.solidStar, size: 8.0)];
    }

    return [Icon(FontAwesomeIcons.solidStar, size: 8.0), Icon(FontAwesomeIcons.solidStar, size: 8.0)];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            child: this.widget.img,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(this.widget.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                child: Container(
                  constraints: BoxConstraints.tight(Size(30.0, 30.0)),
                  child: Image(
                    image: AssetImage('assets/weakness/weakness_fire.png'),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _getMonsterWeaknessAsSimpleIndicator(widget.weakness.fire),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                child: Container(
                  constraints: BoxConstraints.tight(Size(30.0, 30.0)),
                  child: Image(
                    image: AssetImage('assets/weakness/weakness_water.png'),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _getMonsterWeaknessAsSimpleIndicator(widget.weakness.water),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                child: Container(
                  constraints: BoxConstraints.tight(Size(30.0, 30.0)),
                  child: Image(
                    image: AssetImage('assets/weakness/weakness_thunder.png'),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _getMonsterWeaknessAsSimpleIndicator(widget.weakness.thunder),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                child: Container(
                  constraints: BoxConstraints.tight(Size(30.0, 30.0)),
                  child: Image(
                    image: AssetImage('assets/weakness/weakness_ice.png'),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _getMonsterWeaknessAsSimpleIndicator(widget.weakness.ice),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Padding(
                child: Container(
                  constraints: BoxConstraints.tight(Size(30.0, 30.0)),
                  child: Image(
                    image: AssetImage('assets/weakness/weakness_dragon.png'),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _getMonsterWeaknessAsSimpleIndicator(widget.weakness.dragon),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
