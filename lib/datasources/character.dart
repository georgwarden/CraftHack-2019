
import 'dart:io';

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
      chars: null,
      skills: null,
      initiative: 5,
      speed: 5,
      armorClass: 0,
      hits: null
    );
  }

}