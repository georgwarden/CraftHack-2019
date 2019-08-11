import 'package:crafthack_app/models/Character.dart';

class ModEvent {

  List<CharChange> changes;
  String description;

  ModEvent({
    this.changes,
    this.description
  });

  factory ModEvent.fromJson(Map<String, dynamic> json) {
    return ModEvent(
      changes: json['changes'].map((dyn) => CharChange.fromJson(dyn)),
      description: json['backstory']
    );
  }

}

class CharChange {

  CharOption char;
  int newBaseValue;
  int newModifier;

  CharChange({
    this.char,
    this.newBaseValue,
    this.newModifier
  });

  factory CharChange.fromJson(Map<String, dynamic> json) {
    return CharChange(
      char: charFromString(json['attribute']),
      newBaseValue: json['baselineDelta'],
      newModifier: json['modifDelta']
    );
  }

}