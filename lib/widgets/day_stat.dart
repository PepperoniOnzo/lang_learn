import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lang_learn/data/week_stat.dart';

class DayStat extends StatelessWidget {
  final WeekStat weekStat;
  final String dayOfWeek = DateFormat('d').format(DateTime.now());
  final String month = DateFormat('MMMM').format(DateTime.now());

  DayStat({Key? key, required this.weekStat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$month, $dayOfWeek",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            // Text(weekStat.points!.join(' '))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < weekStat.points!.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      weekStat.points![i].toString(),
                      style: TextStyle(
                          fontSize: 17,
                          color: double.parse(weekStat.points![i]) > 0
                              ? Colors.green
                              : Colors.red),
                    ),
                  )
              ],
            )
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: <Widget>[
                Text(
                  weekStat.avg.toString(),
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                weekStat.avg != 0.0
                    ? weekStat.avg! > 0
                        ? const Icon(
                            Icons.arrow_drop_up,
                            size: 35,
                          )
                        : const Icon(
                            Icons.arrow_drop_down,
                            size: 35,
                          )
                    : const Text(
                        "~",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black, width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: <Widget>[
                      Text(weekStat.todayUp.toString(),
                          style: TextStyle(fontSize: 17)),
                      const Icon(Icons.arrow_drop_up)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(weekStat.todayDown.toString(),
                          style: TextStyle(fontSize: 17)),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

// Icons.arrow_drop_up