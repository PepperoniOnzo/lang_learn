import 'package:flutter/material.dart';
import 'package:lang_learn/data/data.dart';

import '../data/word_translate.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Data data = Data();
  bool _isInited = false;

  _modifyData(List<WordTranslate> modDict, double known, double unknown) {
    setState(() {
      data.modifyData(modDict, known, unknown);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !_isInited
            ? FutureBuilder(
                future: data.initAll(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    _isInited = true;
                    return Column(children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: DayStat(
                            weekStat: data.weekStat,
                          )),
                      Expanded(
                          flex: 2,
                          child: SwipeWords(dictList: data.dictionary)),
                      Expanded(
                          flex: 3,
                          child: Dictionary(dictList: data.dictionary)),
                      Expanded(
                          flex: 3,
                          child: Learn(
                            words: data.dictionary,
                            modifyData: _modifyData,
                          )),
                    ]);
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text('D.',
                            style: TextStyle(
                                fontSize: 100, fontWeight: FontWeight.bold)),
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
              )
            : Column(children: <Widget>[
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
                      modifyData: _modifyData,
                    )),
              ]));
  }
}
