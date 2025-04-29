import 'package:flutter/material.dart';

void main() {
  runApp(Rection_test());
}

class Rection_test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Game_page(),
    );
  }
}

class Game_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Game_page();
  }
}

class _Game_page extends State<Game_page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("попади в круг"),
        centerTitle: true,
      ),
    );
  }
}
