import 'package:flutter/material.dart';

import 'package:lang_learn/screens/screens.dart';
import 'data/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AnyRoutes.home,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => const UnknownPage()),
        routes: {
          AnyRoutes.home: (context) => HomePage(),
        });
  }
}
