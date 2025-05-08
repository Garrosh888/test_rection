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
  int milliseconds_ball = 4000;
  int anti_points = 0;

  void add_points(){
    setState(() {
      points++;
      if(milliseconds_ball>1100){
        milliseconds_ball-=300;
      }
    });
    timer?.cancel();
    move_circle();
  }

  void move_circle(){
    timer?.cancel();
    setState(() {
      x = Random().nextDouble()* (MediaQuery.of(context).size.width);
      y = Random().nextDouble()* (MediaQuery.of(context).size.height);
    });
    timer = Timer.periodic(Duration(milliseconds: milliseconds_ball), (_){
      setState(() {
        x = Random().nextDouble()* (MediaQuery.of(context).size.width);
        y = Random().nextDouble()* (MediaQuery.of(context).size.height);
        anti_points++;
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
        title: Text("попади в круг, очки:$points , не попал :$anti_points"),
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
              child: ElevatedButton(
                onPressed: click_start, 
                child: Text(
                  "start",
                  style: TextStyle(color: Colors.yellow,fontSize: 25),
                  ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
                  ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Text("программа для проверки реакции")),
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
