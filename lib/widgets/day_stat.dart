import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lang_learn/data/week_stat.dart';

class DayStat extends StatelessWidget {
  final WeekStat weekStat;
  final String dayOfWeek = DateFormat('EEE').format(DateTime.now());

  DayStat({Key? key, required this.weekStat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            7,
            (i) => Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.9 / 7,
                  decoration: weekStat.days[i] == dayOfWeek
                      ? BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15))
                      : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        weekStat.date![i].toString(),

                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(weekStat.days[i],
                          style: const TextStyle(fontSize: 15)),
                      Row(
                        children: <Widget>[
                          Text("${weekStat.points![i]}"),
                          double.parse(weekStat.points![i]) != 0.0
                              ? double.parse(weekStat.points![i]) > 0.0
                                  ? Icon(Icons.arrow_drop_up)
                                  : Icon(Icons.arrow_drop_down)
                              : Icon(Icons.numbers)
                        ],
                      )
                    ],
                  ),
                )));
  }
}
