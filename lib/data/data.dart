import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lang_learn/data/week_stat.dart';
import 'package:lang_learn/data/word_translate.dart';

class Data {
  WeekStat weekStat = WeekStat();
  late List<WordTranslate> dictionary;

  Data();

  Future<WeekStat> initAll() async {
    String parsed = await rootBundle.loadString('assets/week.json');
    var parsedJson = jsonDecode(parsed);
    weekStat.fromJson(parsedJson);
    return weekStat;
  }
}
