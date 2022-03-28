import 'dart:ffi';

import 'package:lang_learn/data/json_parser.dart';

class WeekStat implements JsonParser {
  List<int>? date;
  List<String>? points;
  double? avg;
  String?  todayDown, todayUp;

  WeekStat({this.date, this.points, this.avg, this.todayDown, this.todayUp});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['points'] = points;
    data['avg'] = avg;
    data['todayDown'] = todayDown;
    data['todayUp'] = todayUp;
    return data;
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    date = json['date'].cast<int>();
    points = json['points'].cast<String>();
    avg = double.tryParse(json['avg']);
    todayDown = json['todayDown'];
    todayUp = json['todayUp'];
  }
}
