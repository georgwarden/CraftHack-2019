

import 'package:crafthack_app/utils/function.dart';
import 'package:flutter/material.dart';

class TextFutureLoader extends StatelessWidget {

  final Future<String> future;
  final Function1<String, Text> widgetBuilder;

  TextFutureLoader({this.future, this.widgetBuilder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (ctx, snap) {
        switch(snap.connectionState) {
          case ConnectionState.none:
            return widgetBuilder("загрузка...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return widgetBuilder("загрузка...");
          case ConnectionState.done:
            return widgetBuilder(snap.data);
        }
      },
    );
  }


}