class HitEvent {
  int newHits;

  HitEvent({this.newHits});

  factory HitEvent.fromJson(Map<String, dynamic> json) {
    return HitEvent(
      newHits: json['new_hits']
    );
  }

}
