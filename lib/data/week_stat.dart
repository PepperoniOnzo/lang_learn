import 'package:lang_learn/data/json_parser.dart';

class WeekStat implements JsonParser {
  List<int>? date;
  List<String>? points;
  double avg,  todayDown, todayUp;

  WeekStat({this.date, this.points, this.avg = 0, this.todayDown=0, this.todayUp=0});

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
    avg = json['avg'] as double;
    todayDown = json['todayDown'] as double;
    todayUp = json['todayUp'] as double;
  }
}
