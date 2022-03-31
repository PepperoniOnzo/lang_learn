import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

import '../../data/colors.dart';

class CardStat extends StatefulWidget {
  const CardStat(
      {Key? key,
      required this.known,
      required this.unknown,
      required this.endTraining})
      : super(key: key);
  final double known, unknown;
  final Function endTraining;

  @override
  State<CardStat> createState() => _CardStatState();
}

class _CardStatState extends State<CardStat> {
  bool _isEvaluated = true;

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeLeft: (finalPosition) {
        widget.endTraining();
      },
      onSwipeRight: (finalPosition) {
        widget.endTraining();
      },
      onSwipeDown: (finalPosition) {
        widget.endTraining();
      },
      onSwipeUp: (finalPosition) {
        widget.endTraining();
      },
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          child: GestureDetector(
            onTap: (() {
              setState(() {
                _isEvaluated = false;
              });
            }),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  color: MyColors.greanMain,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: AnimatedSwitcher(
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    child: _isEvaluated
                        ? const Text(
                            "Press to see stats",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        : Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                                child: Text(
                                  "Statistics",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    const Icon(Icons.arrow_drop_up,
                                        color: Colors.white, size: 30),
                                    Text(
                                      "${(widget.known / 0.1).floor()} | ${widget.known.toStringAsFixed(1)}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.white,
                                thickness: 2,
                                endIndent: 25,
                                indent: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${(widget.unknown / 0.2).floor()} | ${widget.unknown.toStringAsFixed(1)}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    const Icon(Icons.arrow_drop_down,
                                        color: Colors.white, size: 30),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                  "${double.parse((widget.known - widget.unknown).toStringAsFixed(1))}",
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("SWIPE TO RETURN HOME",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ),
                            ],
                          ))),
          ),
        ),
      ),
    );
  }
}
