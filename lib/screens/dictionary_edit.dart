import 'package:flutter/material.dart';
import 'package:lang_learn/data/routes.dart';

import '../data/word_translate.dart';

class DictEdit extends StatefulWidget {
  const DictEdit({Key? key}) : super(key: key);

  @override
  State<DictEdit> createState() => _DictEditState();
}

class _DictEditState extends State<DictEdit> {
  // final _textWord = TextEditingController();
  // final _textTranslate = TextEditingController();

  // @override
  // void dispose() {
  //   _textWord.dispose();
  //   _textTranslate.dispose();
  //   super.dispose();
  // }

  // String? get _errorWord {
  //   final text = _textWord.value.text;
  //   if (text.isEmpty) {
  //     return 'Can\'t be empty';
  //   }
  //   return null;
  // }

  // String? get _errorTranslate {
  //   final text = _textTranslate.value.text;
  //   if (text.isEmpty) {
  //     return 'Can\'t be empty';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    String changedWord = '', changedTranslate = '';

    final arguments = ModalRoute.of(context)?.settings.arguments as List;
    List<WordTranslate> words = arguments[0];
    Function modifyData = arguments[1];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        setState(() {
          modifyData(words);
        });
        return true;
      },
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 10),
                  child: Text('Words', style: TextStyle(fontSize: 35.0)),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${words.length}"),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Add new word'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text("Can't be empty")),
                                TextField(
                                  onChanged: (value) {
                                    changedWord = value;
                                  },
                                  controller: TextEditingController(text: ''),
                                  decoration: const InputDecoration(
                                    labelText: 'Word',
                                  ),
                                ),
                                TextField(
                                  onChanged: (value) {
                                    changedTranslate = value;
                                  },
                                  controller: TextEditingController(text: ''),
                                  decoration: const InputDecoration(
                                    labelText: 'Translate',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Save'),
                                    onPressed: () {
                                      setState(() {
                                        if (changedWord != '' &&
                                            changedTranslate != '') {
                                          words.add(WordTranslate(
                                            word: changedWord,
                                            translate: changedTranslate,
                                          ));

                                          // _textTranslate.clear();
                                          // _textWord.clear();

                                          modifyData(words);
                                          Navigator.of(context).pop();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: words.length != 0
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      final item = words[index].word;
                      return Dismissible(
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  '${words[words.indexWhere((element) => element.word == item)].word} dismissed')));
                          setState(() {
                            words.removeAt(words
                                .indexWhere((element) => element.word == item));
                          });
                          modifyData(words);
                        },
                        key: Key(UniqueKey().toString()),
                        child: ListTile(
                          title: Text(words[index].word ?? 'Nonsense',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          subtitle: Text(words[index].translate ?? 'Nonsense',
                              style: TextStyle(fontSize: 16)),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit word'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            onChanged: (value) {
                                              changedWord = value;
                                            },
                                            controller: TextEditingController(
                                                text: words[index].word),
                                            decoration: const InputDecoration(
                                              labelText: 'Word',
                                            ),
                                          ),
                                          TextField(
                                            onChanged: (value) {
                                              changedTranslate = value;
                                            },
                                            controller: TextEditingController(
                                                text: words[index].translate),
                                            decoration: const InputDecoration(
                                              labelText: 'Translate',
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Save'),
                                              onPressed: () {
                                                setState(() {
                                                  if (changedWord != '') {
                                                    words[index].word =
                                                        changedWord;
                                                  }
                                                  if (changedTranslate != '') {
                                                    words[index].translate =
                                                        changedTranslate;
                                                  }
                                                });
                                                modifyData(words);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('No words?', style: TextStyle(fontSize: 20)),
                  ),
          )
        ]),
      ),
    );
  }
}
