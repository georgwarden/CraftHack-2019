import 'package:crafthack_app/datasources/character.dart';
import 'package:crafthack_app/models/Character.dart';
import 'package:crafthack_app/widgets/future_loader.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  final CharacterSource _characterSource = StubCharacterSource();

  @override
  Widget build(BuildContext context) {
    Future<Character> fChar = _characterSource.getCharacter();
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                child:
                    Image.asset("assets/barbarian.png", width: 48, height: 48),
                padding: EdgeInsets.only(bottom: 8, right: 8),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFutureLoader(
                    future: fChar.then((char) => char.name),
                    widgetBuilder: _nameText,
                  ),
                  Row(
                    children: <Widget>[
                      TextFutureLoader(
                        future: fChar.then((char) => char.race),
                        widgetBuilder: _raceRoleText,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                      ),
                      TextFutureLoader(
                        future: fChar.then((char) => char.role),
                        widgetBuilder: _raceRoleText,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Text(
            "Будучи в детстве изгнанным из собственного племени, Конан долгое время скитался по пустошам Аркании, сражаясь со страшными монстрами, пока не обрёл величайшую мощь, которой человек может достигнуть.",
            style: TextStyle(color: Colors.black54, fontSize: 16),
          )
        ],
      ),
      padding: EdgeInsets.all(16),
    );
  }

  Text _nameText(String name) {
    return Text(
      name,
      style: TextStyle(
          color: Colors.deepPurple, fontSize: 20, fontWeight: FontWeight.w800),
    );
  }

  Text _raceRoleText(String text) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 18,
          fontWeight: FontWeight.w700),
    );
  }
}
