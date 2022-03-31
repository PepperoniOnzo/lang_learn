import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:lang_learn/data/word_translate.dart';

import '../../data/colors.dart';

class CardD extends StatefulWidget {
  CardD(
      {Key? key,
      required this.wordTranslate,
      required this.index,
      required this.swipeLeft,
      required this.swipeRight})
      : super(key: key);

  final int index;
  final Function swipeLeft, swipeRight;
  WordTranslate wordTranslate;

  @override
  State<CardD> createState() => _CardDState();
}

class _CardDState extends State<CardD> {
  bool _isEvelated = true;
  String word = '', translate = '';

  @override
  void initState() {
    super.initState();
    word = widget.wordTranslate.word!;
    translate = widget.wordTranslate.translate!;
  }

  @override
  Widget build(BuildContext context) {
    return Swipable(
      verticalSwipe: false,
      onSwipeLeft: (_) {
        widget.swipeLeft(widget.index);
      },

      onSwipeRight: (_) {
        widget.swipeRight(widget.index);
      },

      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: GestureDetector(
            onTap: () => setState(() {
              _isEvelated = !_isEvelated;
            }),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                    color: MyColors.greanMain,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: _isEvelated
                        ? [
                            const BoxShadow(
                                color: MyColors.greanSecond,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            const BoxShadow(
                                color: MyColors.greanThird,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]
                        : null),
                child: AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  child: !_isEvelated
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                word,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                translate,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            word,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                )),
          ),
        ),
      ),
    );
  }
}
