

import 'dart:async';

import 'package:crafthack_app/models/socket.dart';
import 'package:flutter/widgets.dart';

class BattleScreen extends StatefulWidget {

  final Stream<Event> socketEvents;

  BattleScreen({this.socketEvents});

  @override
  State<StatefulWidget> createState() => _BattleState();

}

class _BattleState extends State<BattleScreen> {

  bool _turn = false;

  @override
  void initState() {
    super.initState();
    widget.socketEvents.listen(_onEvent);
  }

  void _onEvent(Event event) {
    switch(event.type) {
      case EventType.hit_event:
        // TODO: Handle this case.
        break;
      case EventType.begin_battle:
        break;
      case EventType.turn:
        setState(() {
          _turn = true;
        });
        break;
      case EventType.pass:
        setState(() {
          _turn = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(_turn ? "assets/sunrise.png" : "assets/moon.png"),
    );
  }

}