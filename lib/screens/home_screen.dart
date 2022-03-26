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
  void initState() {
    super.initState();
    data.initAll().then((value) {
      setState(() {
        data.weekStat=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
            flex: 3,
            child: DayStat(
              weekStat: data.weekStat,
            )),
        Expanded(flex: 1, child: Container()),
        Expanded(flex: 3, child: Dictionary()),
        Expanded(flex: 3, child: Learn()),
      ]),
    );
  }
}
