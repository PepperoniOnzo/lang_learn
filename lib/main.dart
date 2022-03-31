import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lang_learn/screens/screens.dart';
import 'package:lang_learn/screens/swipeable.dart';
import 'data/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            )),
        initialRoute: AnyRoutes.home,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => const UnknownPage()),
        routes: {
          AnyRoutes.home: (context) => HomePage(),
          AnyRoutes.swiping: (context) => SwipAble(),
          AnyRoutes.dictionaryEdit: (context) => DictEdit(),
        });
  }
}

