import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class CardD extends StatelessWidget {
  final Color color;
  CardD(this.color);

  @override
  Widget build(BuildContext context) {
    return Swipable(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: color),
    ));
  }
}