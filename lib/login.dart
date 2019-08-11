import 'package:crafthack_app/utils/string_callback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final StringCallback onLogin;

  LoginScreen({this.onLogin});

  @override
  State<StatefulWidget> createState() => _LoginState(onLogin: onLogin);
}

class _LoginState extends State<LoginScreen> {
  final StringCallback onLogin;

  _LoginState({this.onLogin});

  String _current = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/ember-shot.png",
              width: 96,
              height: 96,
            ),
            Container(
              child: TextField(
                maxLines: 1,
                onChanged: (str) {
                  _current = str;
                },
                decoration: InputDecoration(
                  hintText: "айди...",
                ),
              ),
              padding: EdgeInsets.only(left: 128, right: 128),
            ),
            FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text("ВОЙТИ"),
              onPressed: () {
                debugPrint(onLogin.toString());
                onLogin(_current);
              },
            )
          ],
        ),
      ),
    );
  }
}
