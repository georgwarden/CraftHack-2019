import 'package:flutter/material.dart';

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sss'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [

        ],
      ),
    );
  }
}
