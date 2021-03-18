import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String _name;
  int _score;
  int _stageToCompletion;

  String get name => _name;
  int get score => _score;
  int get stageToCompleteion => _stageToCompletion;


  void setName(String name){
    _name = name;
  }
  void addScore(int amount){
    if(_score == null){
      _score = 0;
      _stageToCompletion = 0;
    }

    if(_stageToCompletion < 6){
      _stageToCompletion += 1;
    }

    _score += amount;
    notifyListeners();
  }

}