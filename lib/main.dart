import 'dart:async';
import 'dart:math';

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
  bool start_game = false;
  double x = 100;
  double y = 100;
  Timer? timer;
  int points = 0;

  void add_points(){
    setState(() {
      points++;
    });
  }

  void move_circle(){
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: 2000), (_){
      setState(() {
        x = Random().nextDouble()* (MediaQuery.of(context).size.width);
        y = Random().nextDouble()* (MediaQuery.of(context).size.height);
      });
    });
    
  }

  void click_start(){
    setState(() {
      start_game = true;  
    });
    move_circle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(// это виджет это вся верхняя часть 
        title: Text("попади в круг, очки:$points"),
        centerTitle: true,
        backgroundColor: Colors.pink
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
            if(start_game == false)
            Center(
              child: ElevatedButton(onPressed: click_start, child: Text("start")),
            ),
            if(start_game == true)
            Positioned(
              left: x,
              top: y,
              child: GestureDetector(
                onTap: add_points,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle
                ),
              ),
            )) 
          ],),
      ),
    );
  }
}
