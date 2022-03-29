import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lang_learn/data/word_translate.dart';

class SwipeWords extends StatelessWidget {
  const SwipeWords({Key? key, required this.dictList}) : super(key: key);
  final List<WordTranslate> dictList;

  List<WordTranslate> shuffleDictList() {
    List<WordTranslate> list = List<WordTranslate>.from(dictList);
    if (dictList.length >= 5) {
      list.shuffle();
      list.length = 5;
      return list;
    }
    return List.generate(
        5,
        (index) => WordTranslate(
              word: 'You need to add more words',
              translate: 'To add more words, go to the dictionary',
            ));
  }

  @override
  Widget build(BuildContext context) {
    final List<WordTranslate> swipeDict = shuffleDictList();

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: swipeDict.map((WordTranslate dict) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(1, 121, 78, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '"${dict.word}"',
                        style: const TextStyle( 
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        dict.translate!,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
