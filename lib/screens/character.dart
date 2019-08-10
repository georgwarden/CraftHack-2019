import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset("assets/barbarian.png"),
            Column(
              children: <Widget>[
                Text("Воинственный Конан"),
                Row(
                  children: <Widget>[
                    Text("Человек"),
                    Text("Варвар")
                  ],
                )
              ],
            )
          ],
        ),
      Text("Будучи в детстве изгнанным из собственного племени, Конан долгое время скитался по пустошам Аркании, сражаясь со страшными монстрами, пока не обрёл величайшую мощь, которой человек может достигнуть.")
      ],
    );
  }

}