
import 'package:lang_learn/data/json_parser.dart';

class WeekStat implements JsonParser{
  List<int>? date;
  List<double>? points;

  final List<String> days = ['Mon','Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  WeekStat({this.date, this.points});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['points'] = points;
    return data;
  }

  @override
  void fromJson(Map<String, dynamic> json) {
    date = json['date'].cast<int>();
    points = json['points'].cast<double>();
  }
}