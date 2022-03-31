import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeumoBtnStatic extends StatelessWidget {
  const NeumoBtnStatic({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ),
      ),
    );
  }
}
