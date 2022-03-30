import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

import '../../data/colors.dart';

class CardInfo extends StatelessWidget {
  CardInfo();

  @override
  Widget build(BuildContext context) {
    return Swipable(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0), color: MyColors.greanMain),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Unknown',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(Icons.arrow_left_outlined, color: Colors.white, size: 30),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.white,
            endIndent: 10,
            indent: 10,
            thickness: 2,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Known', style: TextStyle(fontSize: 20, color: Colors.white)),
                Icon(Icons.arrow_right_outlined, color: Colors.white, size: 30), 
              ],
            ),
          ),
        ],
      ),
    ));
  }
} 