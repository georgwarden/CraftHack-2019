
class Event {

  EventType type;
  dynamic body;

  Event({this.type, this.body});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      type: evtFromString(json['type']),
      body: json['body'],
    );
  }

}

EventType evtFromString(String str) {
  switch(str) {
    case 'hit_event':
      return EventType.hit_event;
    case 'begin_battle':
      return EventType.begin_battle;
    case 'turn':
      return EventType.turn;
    case 'pass':
      return EventType.pass;
  }
}

enum EventType {
  hit_event,
  begin_battle,
  turn,
  pass
}