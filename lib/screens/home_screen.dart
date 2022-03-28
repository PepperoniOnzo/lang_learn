import 'package:flutter/material.dart';
import 'package:lang_learn/data/data.dart';

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
              Expanded(
                  flex: 2,
                  child: DayStat(
                    weekStat: data.weekStat,
                  )),
              Expanded(flex: 1, child: SwipeWords()),
              Expanded(flex: 3, child: Dictionary()),
              Expanded(flex: 3, child: Learn()),
            ]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
