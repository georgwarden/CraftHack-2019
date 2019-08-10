
class Event {

  String type;
  dynamic body;

  Event({this.type, this.body});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      type: json['type'],
      body: json['body'],
    );
  }

}