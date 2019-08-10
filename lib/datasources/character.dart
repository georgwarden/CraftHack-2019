import 'dart:io';
import 'dart:math';

import 'package:crafthack_app/models/Character.dart';

abstract class CharacterSource {
  Future<Character> getCharacter();
}

class StubCharacterSource implements CharacterSource {
  @override
  Future<Character> getCharacter() async {
    return Character(
        id: 0,
        name: 'Воинственный Конан',
        race: 'Человек',
        role: 'Варвар',
        hp: 15,
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
        hits: null);
  }
}
