import 'package:crafthack_app/datasources/character.dart';
import 'package:crafthack_app/models/Character.dart';
import 'package:crafthack_app/utils/function.dart';
import 'package:crafthack_app/widgets/future_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharacterScreen extends StatelessWidget {
  final CharacterSource _characterSource = StubCharacterSource();

  @override
  Widget build(BuildContext context) {
    Future<Character> fChar = _characterSource.getCharacter();
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 16),),
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
          ),
          Divider(color: Colors.black, height: 16,),
          Padding(padding: EdgeInsets.only(top: 8),),
          FutureBuilder(
            future: fChar.then((char) => char.chars),
            builder: (ctx, snap) {
              switch (snap.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  return _createAttributes(snap.data);
              }
            },
          ),
          FutureBuilder(
            future: fChar.then((char) => char.skills),
            builder: (ctx, snap) {
              switch (snap.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return _createSkills(snap.data);
              }
            },
          ),
          Padding(padding: EdgeInsets.only(bottom: 16),),
        ],
      ),
      padding: EdgeInsets.only(left: 16, right: 16),
    );
  }

  Widget _createAttributes(Map<CharOption, Char> attributes) {
    Function1<String, Text> attrText = (text) => Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.teal),
        );
    List<Widget> displayList = attributes.keys
        .map((attribute) => Row(
              children: <Widget>[
                _getAttrIcon(attribute),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                attrText(attribute.toString().replaceAll('CharOption.', '')),
                attrText(":  "),
                attrText(attributes[attribute].total().toString())
              ],
            ))
        .expand((row) => <Widget>[
              row,
              Padding(
                padding: EdgeInsets.all(4),
              )
            ])
        .toList();
    return Column(
      children: displayList,
    );
  }

  Widget _createSkills(Map<Skill, int> skills) {
    List<Widget> displayList = skills.keys.map((skill) => Row(
      children: <Widget>[
        Text(skill.toString().replaceAll('Skill.', '')),
        Text(":  "),
        Text(skills[skill].toString())
      ],
    )).toList();
    return Column(
      children: displayList,
    );
  }

  Widget _getAttrIcon(CharOption attr) {
    String url;
    switch (attr) {
      case CharOption.strength:
        url = "https://image.flaticon.com/icons/svg/94/94085.svg";
        break;
      case CharOption.charisma:
        url = "https://image.flaticon.com/icons/svg/1449/1449953.svg";
        break;
      case CharOption.wisdom:
        url = "https://image.flaticon.com/icons/svg/947/947566.svg";
        break;
      case CharOption.dexterity:
        url = "https://image.flaticon.com/icons/svg/1477/1477296.svg";
        break;
      case CharOption.constitution:
        url = "https://image.flaticon.com/icons/svg/1401/1401497.svg";
        break;
      case CharOption.intelligence:
        url = "https://image.flaticon.com/icons/svg/1491/1491214.svg";
        break;
    }
    return SvgPicture.network(
      url,
      width: 36,
      height: 36,
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
