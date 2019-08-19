import 'package:flutter/material.dart';
import 'package:smalltarget/state/targetModel.dart';

class CurrentTargetModel extends ChangeNotifier {

  List<TargetModel> targets = [
    new TargetModel()
      ..targetId="getUpEarly"
      ..title = "早起"
      ..targetImg = "lib/assets/images/get_up_early.jpeg"
      ..completedDay = 8
      ..targetIcon = Icons.accessibility_new,

    new TargetModel()
      ..targetId="sport"
      ..title = "每天运动"
      ..targetImg = "lib/assets/images/sport_everyday.jpeg"
      ..completedDay = 10
      ..targetIcon = Icons.directions_run,

    new TargetModel()
      ..targetId="readBook"
      ..title = "每天读书"
      ..targetImg = "lib/assets/images/read_book.jpeg"
      ..completedDay = 9
      ..targetIcon = Icons.book,


    new TargetModel()
      ..targetId="callFamily"
      ..title = "给家人打电话"
      ..targetImg = "lib/assets/images/call_family.jpeg"
      ..completedDay = 20
      ..targetIcon = Icons.add_call,
  ];

  TargetModel getTarget(int index) {
    if (index > targets.length) {
      return null;
    }
    return targets[index];
  }

  void addTarget(TargetModel target) {
    if (!containTarget(target.targetId)) {
      targets.add(target);
      notifyListeners();
    }
  }

  ///删除目标,根据目标Id删除对象的目标
  void removeTarget(TargetModel target) {
    for (int i = 0; i < targets.length; ++ i) {
      if (targets[i].targetId == target.targetId) {
        targets.removeAt(i);
      }
    }
    notifyListeners();
  }

  bool containTarget(String targetId) {
    for (TargetModel model in targets) {
      if (model.targetId == targetId) {
        return true;
      }
    }

    return false;
  }

  int targetNumber() {
    return targets.length;
  }
}