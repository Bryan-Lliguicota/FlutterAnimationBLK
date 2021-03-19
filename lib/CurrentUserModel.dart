import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CurrentUserModel with ChangeNotifier {
  CurrentUserModel({this.name, this.actionsCompleted});

  final String name;
  int actionsCompleted;

  int getActionsCompletedCount(){
    return actionsCompleted;
  }

  void increaseActionCompletedCount() {
    if(actionsCompleted < 6 ) {
      this.actionsCompleted++;
    }
    notifyListeners();
  }
}