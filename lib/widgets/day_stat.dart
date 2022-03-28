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
          children: [
            Text(
              "$month, $dayOfWeek",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(weekStat.points!.join(' '))
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                weekStat.avg != 0.0
                    ? weekStat.avg! > 0
                        ? Icon(Icons.arrow_drop_up)
                        : Icon(Icons.arrow_drop_down)
                    : const Text(
                        "~",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
              ],
            ),
            const Divider( color: Colors.black, thickness: 2, endIndent: 2, ),
            Row(         
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      weekStat.todayUp.toString()
                    ),
                    const Icon(Icons.arrow_drop_up)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      weekStat.todayDown.toString()
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

// Icons.arrow_drop_up