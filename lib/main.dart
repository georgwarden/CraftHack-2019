import 'dart:async';

import 'package:crafthack_app/config.dart';
import 'package:crafthack_app/screens/character.dart';
import 'package:crafthack_app/screens/dice.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

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

  Lazy<CharacterScreen> _characterScreen = Lazy(() => CharacterScreen());
  Lazy<DiceScreen> _diceScreen = Lazy(() => DiceScreen());

  final socket = IOWebSocketChannel.connect(SocketUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sss'),
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
            title: Text("Кубик")
          )
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }

  Widget _buildBody(int index) {
    switch(index) {
      case 0:
        return _characterScreen.get();
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
