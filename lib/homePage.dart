import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/CurrentUserModel.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

AnimationController _controller;
Map stageToAnimationTime = new Map();
int counter = 0;

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  onActionCountIncrease(person){
    print(stageToAnimationTime.toString());
    person.increaseActionCompletedCount();
    int actionsCompletedCount = person.getActionsCompletedCount();
    print("Score was increased: ");
    print("New Score: " + actionsCompletedCount.toString());
    counter ++;
    if(_controller != null && actionsCompletedCount < 6 && actionsCompletedCount != 0){
      _controller.repeat();
      Timer(stageToAnimationTime[actionsCompletedCount], () {
        _controller.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    stageToAnimationTime[1] = new Duration(milliseconds: 55);
    stageToAnimationTime[2] = new Duration(milliseconds: 1190);
    stageToAnimationTime[3] = new Duration(milliseconds: 1230);
    stageToAnimationTime[4] = new Duration(milliseconds: 1470);
    stageToAnimationTime[5] = new Duration(milliseconds: 1870);

    return Consumer<CurrentUserModel>(
        builder: (context, person, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${person.name} has completed ${person.actionsCompleted} actions"),
            ),
            body: TreePage(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                onActionCountIncrease(person);
              },
            ),
          );
        }
    );
  }
}





class TreePage extends StatefulWidget{

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> with TickerProviderStateMixin{

  var stageToAnimationTime = new Map();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 8));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _){
          return ListView(  children: [
            Card(
              elevation: 20,
              shape: Border.all(),
              color: Colors.blue[50],
              child: Lottie.asset(
                'assets/21255-island-with-buildings-and-trees.json',
                controller: _controller,
                repeat: false,
                height: 300,
              ),
            )
          ],
          );
        }
    );
  }}

