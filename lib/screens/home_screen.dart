import 'package:flutter/material.dart';
import 'package:lang_learn/data/data.dart';
import 'package:lang_learn/data/week_stat.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Data data = Data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data.initAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(children: <Widget>[
              //need to improve
              Expanded(
                  flex: 2,
                  child: DayStat(
                    weekStat: data.weekStat,
                  )),
              Expanded(flex: 2, child: SwipeWords(dictList: data.dictionary)),
              Expanded(flex: 3, child: Dictionary(dictList: data.dictionary)),
              Expanded(
                  flex: 3,
                  child: Learn(
                    words: data.dictionary,
                  )),
            ]);
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('D.',
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
                Center(
                    child: Center(
                        child: Text(
                  'Loading...',
                  style: TextStyle(fontSize: 30),
                ))),
              ],
            );
          }
        },
      ),
    );
  }
}
