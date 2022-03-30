import 'package:flutter/material.dart';

import '../data/word_translate.dart';

class Dictionary extends StatelessWidget {
  Dictionary({Key? key, required this.dictList}) : super(key: key);

  final List<WordTranslate> dictList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Color.fromRGBO(1, 121, 78, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Dictionary',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Total words: ${dictList.length.toString()}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_drop_up,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                        "${dictList.fold<int>(0, (previousValue, element) => element.rate >= 2 ? previousValue + 1 : previousValue)}",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                )),
            const Divider(
              thickness: 3,
              endIndent: 15,
              indent: 15,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        "${dictList.fold<int>(0, (previousValue, element) => element.rate < 2 ? previousValue + 1 : previousValue)}",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
