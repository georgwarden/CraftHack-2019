import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:crafthack_app/models/Character.dart';

abstract class CharacterSource {
  Future<Character> getCharacter(int id);
}

class NetworkCharacterSource implements CharacterSource {

  @override
  Future<Character> getCharacter(int id) async {
    http.Response res = await http.get(
      "https://crafthack.herokuapp.com/user/" + id.toString(),
    );
    if (res.statusCode == 200)
      return Character.fromJson(jsonDecode(res.body));
    else
      return null;
  }

}

class StubCharacterSource implements CharacterSource {
  @override
  Future<Character> getCharacter(int id) async {
    return Character(
        id: 0,
        name: 'Воинственный Конан',
        race: 'Человек',
        role: 'Варвар',
        chars: <CharOption, Char>{
          CharOption.strength: Char(baseValue: 10, modifier: 10),
          CharOption.charisma: Char(baseValue: 10, modifier: 10),
          CharOption.wisdom: Char(baseValue: 10, modifier: 10),
          CharOption.dexterity: Char(baseValue: 10, modifier: 10),
          CharOption.intelligence: Char(baseValue: 10, modifier: 10),
          CharOption.constitution: Char(baseValue: 10, modifier: 10),
        },
        skills: Map.fromEntries(
            Skill.values.map((skill) => MapEntry(skill, Random().nextInt(10)))),
        initiative: 5,
        speed: 5,
        armorClass: 0,
        hits: Hits(current: 20, maximum: 20));
  }
}
