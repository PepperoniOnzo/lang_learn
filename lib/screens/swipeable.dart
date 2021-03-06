import 'package:flutter/material.dart';
import 'package:lang_learn/data/word_translate.dart';

import '../widgets/swipe_cards/card_stat.dart';
import '../widgets/widgets.dart';

class SwipAble extends StatefulWidget {
  const SwipAble({Key? key}) : super(key: key);

  @override
  State<SwipAble> createState() => _SwipAbleState();
}

class _SwipAbleState extends State<SwipAble> {
  double known = 0, unknown = 0;
  int knownWords = 0;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as List;
    Function modifyData = arguments[0];
    List<WordTranslate> words = arguments[1];
    words.shuffle();
    bool _isPractice = arguments[2];

    endTraining() {
      if (_isPractice) {
        modifyData(words, known, unknown);
      }
      Navigator.pop(context);
    }

    swipeLeft(int index) {
      if (_isPractice) {
        words[index].rate -= 1;
      }
      setState(() {
        unknown += 0.2;
      });
    }

    swipeRight(int index) {
      if (words[index].rate >= 2) {
        setState(() {
          knownWords++;
        });
      } else {
        setState(() {
          known += 0.1;
        });
      }
      if (_isPractice) {
        if (words[index].rate != 3) {
          words[index].rate += 1;
        }
      }
    }

    List<Widget> cards = List.generate(words.length, ((index) {
      return CardD(
        wordTranslate: words[index],
        index: index,
        swipeLeft: swipeLeft,
        swipeRight: swipeRight,
      );
    }));
    cards.add(CardInfo());
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Return to main menu?'),
                content: Text(
                  'Your progress will be lost',
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Yes'),
                      ),
                    ],
                  )
                ],
              ),
            )) ??
            false;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(alignment: Alignment.center, children: [
              CardStat(
                  known: known,
                  unknown: unknown,
                  endTraining: endTraining,
                  knownWords: knownWords),
              Stack(
                children: cards,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
