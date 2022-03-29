import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

final List data = [
  {'color': Colors.red},
  {'color': Colors.blue},
  {'color': Colors.amber},
];

class SwipAble extends StatefulWidget {
  const SwipAble({Key? key}) : super(key: key);

  @override
  State<SwipAble> createState() => _SwipAbleState();
}

class _SwipAbleState extends State<SwipAble> {
  List<Widget> cards = [
    CardD(data[0]['color']),
    CardD(data[1]['color']),
    CardD(data[2]['color']),
    CardInfo(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(
        children: cards,
      ),
    );
  }
}