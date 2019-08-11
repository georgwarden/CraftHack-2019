import 'dart:async';
import 'dart:convert';

import 'package:crafthack_app/config.dart';
import 'package:crafthack_app/login.dart';
import 'package:crafthack_app/screens/battle.dart';
import 'package:crafthack_app/screens/character.dart';
import 'package:crafthack_app/screens/dice.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import 'models/socket.dart';
import 'utils/Lazy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WyvernApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootScene(),
    );
  }
}

class RootScene extends StatefulWidget {
  RootScene({Key key}) : super(key: key);

  @override
  _RootSceneState createState() => _RootSceneState();
}

class _RootSceneState extends State<RootScene> {
  int _selectedIndex = 0;
  bool battleAvailable = false;
  int _playerId = 1;
  bool _login = true;

  final socket = IOWebSocketChannel.connect(SocketUrl);

  Lazy<CharacterScreen> _characterScreen;
  Lazy<BattleScreen> _battleScreen;
  Lazy<DiceScreen> _diceScreen = Lazy(() => DiceScreen());

  LoginScreen _loginScreen;

  @override
  void initState() {
    super.initState();
    final events = socket.stream.map((json) => Event.fromJson(json));

    events.listen(_onEvent);

    _characterScreen = Lazy(() => CharacterScreen(
          playerId: _playerId,
        ));
    _battleScreen = Lazy(() => BattleScreen(
          socketEvents: events,
        ));

    _loginScreen = LoginScreen(onLogin: (id) {
      setState(() {
        _login = false;
        _playerId = int.parse(id);
      });
    });
  }

  void _onEvent(Event event) {
    switch (event.type) {
      case EventType.hit_event:
        break;
      case EventType.begin_battle:
        setState(() {
          battleAvailable = true;
        });
        break;
      case EventType.turn:
        break;
      case EventType.pass:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _login
        ? _loginScreen
        : Scaffold(
            appBar: AppBar(
              title: Text('WyvernApp'),
            ),
            body: _buildBody(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  title: Text("Персонаж"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assistant_photo),
                  title: Text("Битва"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_box_outline_blank),
                  title: Text("Кубик"),
                )
              ],
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
            ),
          );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _characterScreen.get();
      case 1:
        return _battleScreen.get();
      case 2:
        return _diceScreen.get();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        if (battleAvailable) {
          _selectedIndex = index;
        }
      } else {
        _selectedIndex = index;
      }
    });
  }
}
