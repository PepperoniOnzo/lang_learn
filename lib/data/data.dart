import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lang_learn/data/week_stat.dart';
import 'package:lang_learn/data/word_translate.dart';

class Data {
  WeekStat weekStat = WeekStat();
  late List<WordTranslate> dictionary;

  Data();

  Future<bool> initAll() async {
    String parsed = await rootBundle.loadString('assets/week.json');
    var parsedJson = jsonDecode(parsed);
    weekStat.fromJson(parsedJson);

    parsed = await rootBundle.loadString('assets/words.json');
    parsedJson = jsonDecode(parsed);
    dictionary = parsedJson
        .map<WordTranslate>((json) => WordTranslate.fromJson(json))
        .toList();
    dictionary.sort((a, b) => a.compareTo(b));

    return true;
  }

  void modifyData(List<WordTranslate> modDict, double known, double unknown) {
    final String dayOfWeek = DateFormat('d').format(DateTime.now());

    weekStat.todayUp += known;
    weekStat.todayDown -= unknown;
    if (weekStat.avg != 0) {
      weekStat.avg = (weekStat.avg + known - unknown) / 2;
    } else {
      weekStat.avg = known - unknown;
    }
    weekStat.avg = double.parse(weekStat.avg.toStringAsFixed(1));

    if (weekStat.date![4].toString() == dayOfWeek) {
      weekStat.points![4] = weekStat.avg.toStringAsFixed(1);
    } else {
      weekStat.points = weekStat.points!.sublist(1, 5);
      weekStat.points?.add(weekStat.avg.toStringAsFixed(1));

      weekStat.date = weekStat.date!.sublist(1, 5);
      weekStat.date?.add(int.parse(dayOfWeek));
    }
  }
}
