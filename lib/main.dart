import 'package:crafthack_app/screens/character.dart';
import 'package:flutter/material.dart';

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

  Lazy<CharacterScreen> _characterScreen = Lazy(() => CharacterScreen());

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
            title: Text("Персонаж")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            title: Text("Характеристики")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            title: Text("Состояние")
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
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
