library target_data;

import 'package:flutter/material.dart';
import 'package:smalltarget/state/targetModel.dart';

final List<TargetModel> allTargets = [
  new TargetModel()
    ..targetId="getUpEarly"
    ..title = "早起"
    ..targetImg = "lib/assets/images/get_up_early.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.accessibility_new,

  new TargetModel()
    ..targetId="sleepEarly"
    ..title = "早睡"
    ..targetImg = "lib/assets/images/sleep_early.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.airline_seat_individual_suite,

  new TargetModel()
    ..targetId="sport"
    ..title = "每天运动"
    ..targetImg = "lib/assets/images/sport_everyday.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.directions_run,

  new TargetModel()
    ..targetId="readBook"
    ..title = "每天读书"
    ..targetImg = "lib/assets/images/read_book.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.book,

  new TargetModel()
    ..targetId="smellEveryday"
    ..title = "每天笑一笑"
    ..targetImg = "lib/assets/images/smell_everyday.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.insert_emoticon,

  new TargetModel()
    ..targetId="callFamily"
    ..title = "给家人打电话"
    ..targetImg = "lib/assets/images/call_family.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.add_call,


  new TargetModel()
    ..targetId="watchMovie"
    ..title = "每周看电影"
    ..targetImg = "lib/assets/images/watch_movie_every_week.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.movie,

  new TargetModel()
    ..targetId="drinkWater"
    ..title = "多喝热水"
    ..targetImg = "lib/assets/images/drink_water_everyday.jpeg"
    ..completedDay = 0
    ..targetIcon = Icons.local_cafe,

  new TargetModel()
    ..targetId="saveMoney"
    ..title = "攒钱"
    ..targetImg = "lib/assets/images/save_money.png"
    ..completedDay = 0
    ..targetIcon = Icons.attach_money,
];

