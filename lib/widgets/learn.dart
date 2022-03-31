import 'package:flutter/material.dart';
import 'package:lang_learn/data/word_translate.dart';
import 'package:lang_learn/widgets/widgets.dart';

import '../data/routes.dart';

class Learn extends StatefulWidget {
  Learn({Key? key, this.words, required this.modifyData}) : super(key: key);
  List<WordTranslate>? words;
  Function modifyData;

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  late int wordsAmount;
  bool _learn = true, _practice = false;
  bool _w10 = true, _w25 = false, _w50 = false;

   passModifyData(List<WordTranslate> modDict, double known, double unknown) {
    widget.modifyData(modDict, known, unknown);            
  }


  VoidCallback trainOrPractice() {
    if (_learn) {
      return () => setState(() {
            _learn = false;
            _practice = true;
          });
    } else {
      return () => setState(() {
            _learn = true;
            _practice = false;
          });
    }
  }

  VoidCallback callFor10() {
    if (_w10) {
      return () => setState(() {
            _w10 = false;
            _w25 = true;
          });
    }
    return () => setState(() {
          _w10 = true;
          _w25 = false;
          _w50 = false;
        });
  }

  VoidCallback callFor25() {
    if (_w25) {
      return () => setState(() {
            _w25 = false;
            wordsAmount >= 50 ? _w50 = true : _w10 = true;
          });
    }
    return () => setState(() {
          _w10 = false;
          _w25 = true;
          _w50 = false;
        });
  }

  VoidCallback callFor50() {
    if (_w50) {
      return () => setState(() {
            _w10 = true;
            _w25 = false;
            _w50 = false;
          });
    }
    return () => setState(() {
          _w10 = false;
          _w25 = false;
          _w50 = true;
        });
  }

  @override
  void initState() {
    super.initState();
    wordsAmount = widget.words?.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Color.fromRGBO(1, 121, 78, 1),
            borderRadius: BorderRadius.circular(20)),
        child: wordsAmount >= 10
            ? Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Training',
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                      Row(
                        children: [
                          NeumoBtn(
                            callBack: trainOrPractice(),
                            isActive: _learn,
                            text: 'Learn',
                          ),
                          NeumoBtn(
                            callBack: trainOrPractice(),
                            isActive: _practice,
                            text: 'Practice',
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: wordsAmount >= 50
                            ? Row(
                                children: [
                                  NeumoBtn(
                                    callBack: callFor10(),
                                    isActive: _w10,
                                    text: '10',
                                  ),
                                  NeumoBtn(
                                    callBack: callFor25(),
                                    isActive: _w25,
                                    text: '25',
                                  ),
                                  NeumoBtn(
                                    callBack: callFor50(),
                                    isActive: _w50,
                                    text: '50',
                                  ),
                                ],
                              )
                            : wordsAmount >= 25
                                ? Row(
                                    children: [
                                      NeumoBtn(
                                        callBack: callFor10(),
                                        isActive: _w10,
                                        text: '10',
                                      ),
                                      NeumoBtn(
                                        callBack: callFor25(),
                                        isActive: _w25,
                                        text: '25',
                                      ),
                                      const NeumoBtnStatic(text: "50"),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      NeumoBtn(
                                        callBack: () => {},
                                        isActive: _w10,
                                        text: '10',
                                      ),
                                      const NeumoBtnStatic(text: "25"),
                                      const NeumoBtnStatic(text: "50"),
                                    ],
                                  ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const VerticalDivider(
                    thickness: 4,
                    endIndent: 15,
                    indent: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (_w10) {
                          Navigator.popAndPushNamed(context, AnyRoutes.swiping,
                              arguments: [
                                passModifyData,
                                widget.words!.sublist(0, 10),
                                _practice
                              ]);
                          return;
                        } else if (_w25) {
                          Navigator.popAndPushNamed(context, AnyRoutes.swiping,
                              arguments: [
                                widget.modifyData,
                                widget.words!.sublist(0, 25),
                                _practice
                              ]);
                          return;
                        }
                        Navigator.popAndPushNamed(context, AnyRoutes.swiping,
                            arguments: [
                              widget.modifyData,
                              widget.words!.sublist(0, 50),
                              _practice
                            ]);
                        return;
                      },
                      child:
                          Icon(Icons.play_arrow, color: Colors.white, size: 50),
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Training',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Try to add new words",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
