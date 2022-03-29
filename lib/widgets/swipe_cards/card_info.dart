import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class CardInfo extends StatelessWidget {
  CardInfo();

  @override
  Widget build(BuildContext context) {
    return Swipable(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.grey[300]),
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
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.arrow_left_outlined)
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.black,
            endIndent: 5,
            indent: 5,
            thickness: 2,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Known', style: TextStyle(fontSize: 20)),
                Icon(Icons.arrow_right_outlined)
              ],
            ),
          ),
        ],
      ),
    ));
  }
}