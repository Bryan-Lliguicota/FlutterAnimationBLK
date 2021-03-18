import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app/user.dart';



class TreePage extends StatefulWidget{

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> with TickerProviderStateMixin{
  User myUser = User();
  AnimationController _controller;
  var stageToAnimationTime = new Map();

  @override
  void initState() {
    myUser.setName("Bobby");
    stageToAnimationTime[1] = new Duration(milliseconds: 55);
    stageToAnimationTime[2] = new Duration(milliseconds: 1190);
    stageToAnimationTime[3] = new Duration(milliseconds: 1230);
    stageToAnimationTime[4] = new Duration(milliseconds: 1470);
    stageToAnimationTime[5] = new Duration(milliseconds: 1870);

    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 8));

    myUser.addListener(() {
      print("Score was increased: ");
      print("New Score: " + myUser.score.toString());
      int currentLevel = myUser.stageToCompleteion;
      if(currentLevel < 6){
        _controller.repeat();
        Timer(stageToAnimationTime[currentLevel], () {
          _controller.stop();
        });
      }
    });

    _controller.forward();

    Timer(Duration(seconds: 8), () {
      Timer.periodic(new Duration(seconds: 3), (timer) {
        myUser.addScore(3);
      });
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("NetZero App"),
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Lottie.asset(
              'assets/21255-island-with-buildings-and-trees.json',
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}

