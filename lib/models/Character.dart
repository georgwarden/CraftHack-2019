class Character {
  int id;
  String name;
  String race;
  String role;
  String biography;
  Map<CharOption, Char> chars;
  Map<Skill, int> skills;
  int initiative;
  int speed;
  int armorClass;
  Hits hits;

  Character(
      {this.id,
      this.name,
      this.race,
      this.role,
      this.biography,
      this.chars,
      this.skills,
      this.initiative,
      this.speed,
      this.armorClass,
      this.hits});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      biography: json['bio'],
      role: json['role'],
      race: json['race'],
      chars: _parseChars(json['chars']),
      skills: _parseSkills(json['skills']),
      initiative: json['initiative'],
      speed: json['speed'],
      armorClass: json['armorClass'],
      hits: Hits.fromJson(json['hits'])
    );
  }

  static Map<Skill, int> _parseSkills(Map<String, dynamic> json) {
    return json.map((name, value) {
      switch(name) {
        case 'acrobatics':
          return MapEntry(Skill.acrobatics, value);
        case 'animalHanding':
          return MapEntry(Skill.animalHandling, value);
        case 'arcana':
          return MapEntry(Skill.arcana, value);
        case 'athletics':
          return MapEntry(Skill.athletics, value);
        case 'deception':
          return MapEntry(Skill.deception, value);
        case 'history':
          return MapEntry(Skill.history, value);
        case 'insight':
          return MapEntry(Skill.insight, value);
        case 'intimidation':
          return MapEntry(Skill.intimidation, value);
        case 'investigation':
          return MapEntry(Skill.investigation, value);
        case 'medicine':
          return MapEntry(Skill.medicine, value);
        case 'nature':
          return MapEntry(Skill.nature, value);
        case 'perception':
          return MapEntry(Skill.perception, value);
        case 'performance':
          return MapEntry(Skill.performance, value);
        case 'religion':
          return MapEntry(Skill.religion, value);
        case 'sleightOfHand':
          return MapEntry(Skill.sleightOfHand, value);
        case 'stealth':
          return MapEntry(Skill.stealth, value);
        case 'survival':
          return MapEntry(Skill.survival, value);
      }
    });
  }

  static Map<CharOption, Char> _parseChars(Map<String, dynamic> json) {
    return json.map((name, value) {
      switch(name) {
        case 'strength':
          return MapEntry(CharOption.strength, Char.fromJson(value));
        case 'dexterity':
          return MapEntry(CharOption.dexterity, Char.fromJson(value));
        case 'constitution':
          return MapEntry(CharOption.constitution, Char.fromJson(value));
        case 'intelligence':
          return MapEntry(CharOption.intelligence, Char.fromJson(value));
        case 'wisdom':
          return MapEntry(CharOption.wisdom, Char.fromJson(value));
        case 'charisma':
          return MapEntry(CharOption.charisma, Char.fromJson(value));
      }
    });
  }

}

class Hits {
  int current;
  int maximum;

  Hits({this.current, this.maximum});

  factory Hits.fromJson(Map<String, dynamic> json) {
    return Hits(current: json['current'], maximum: json['maximum']);
  }
}

class Char {
  int baseValue;
  int modifier;

  Char({this.baseValue, this.modifier});

  int total() {
    return baseValue + modifier;
  }

  factory Char.fromJson(Map<String, dynamic> json) {
    return Char(baseValue: json['baseValue'], modifier: json['modif']);
  }
}

enum CharOption {
  strength,
  dexterity,
  constitution,
  intelligence,
  wisdom,
  charisma
}

enum Skill {
  acrobatics,
  animalHandling,
  arcana,
  athletics,
  deception,
  history,
  insight,
  intimidation,
  investigation,
  medicine,
  nature,
  perception,
  performance,
  religion,
  sleightOfHand,
  stealth,
  survival
}
