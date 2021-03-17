import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TreePage extends StatefulWidget{

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("NetZero App"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Lottie.asset(
                          'assets/21255-island-with-buildings-and-trees.json',
                          repeat: true,
                          reverse: true,
                          animate: true,
                        )]),
    )
    )
    );
  }
}
