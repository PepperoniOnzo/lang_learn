import 'package:lang_learn/data/json_parser.dart';

class WordTranslate implements JsonParser, Comparable<WordTranslate> {
  String? word;
  String? translate;
  int rate;

  WordTranslate({this.word, this.translate, this.rate = -3});

  @override
  void fromJson(Map<String, dynamic> json) {
    word = json['word'];
    translate = json['translate'];
    rate = json['rate'];
  }

  factory WordTranslate.fromJson(Map<String, dynamic> json) => WordTranslate(
        word: json['word'] as String,
        translate: json['translate'] as String,
        rate: json['rate'] as int,
      );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = word;
    data['translate'] = translate;
    data['rate'] = rate;
    return data;
  }

  @override
  int compareTo(WordTranslate other) {
    if (rate < other.rate) {
      return -1;
    } else if (rate > other.rate) {
      return 1;
    }
    return 0;
  }
}
