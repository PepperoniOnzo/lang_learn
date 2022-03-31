import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lang_learn/data/week_stat.dart';
import 'package:lang_learn/data/word_translate.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Data {
  WeekStat weekStat = WeekStat();
  late List<WordTranslate> dictionary = [];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Data();

  Future<bool> initAll() async {
    final SharedPreferences prefs = await _prefs;
    String? parsed = prefs.getString('weekStat');
    var parsedJson;

    if (parsed != null) {
      parsedJson = jsonDecode(parsed);
      weekStat.fromJson(parsedJson);
    } else {
      weekStat = WeekStat(
          date: [0, 0, 0, 0, 0],
          points: ["0.0", "0.0", "0.0", "0.0", "0.0"],
          avg: 0.0,
          todayDown: 0.0,
          todayUp: 0.0);
    }

    parsed = prefs.getString('dictionary');
    if (parsed != null) {
      parsedJson = jsonDecode(parsed);
      dictionary = parsedJson
          .map<WordTranslate>((json) => WordTranslate.fromJson(json))
          .toList();
      dictionary.sort((a, b) => a.compareTo(b));
    } else {
      dictionary = [];
    }
    return true;
  }

  Future<bool> saveAll() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('weekStat', jsonEncode(weekStat.toJson()));
    prefs.setString('dictionary', jsonEncode(dictionary));
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

    for (var i = 0; i < modDict.length; i++) {
      dictionary[dictionary
              .indexWhere((element) => element.word == modDict[i].word)]
          .rate = modDict[i].rate;
    }
    dictionary.sort((a, b) => a.compareTo(b));
  }

  void modifyDictionary(List<WordTranslate> modDict) {
    dictionary = modDict;
  }
}
