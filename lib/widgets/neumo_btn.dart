import 'package:flutter/material.dart';

import '../data/colors.dart';

class NeumoBtn extends StatelessWidget {
  const NeumoBtn({Key? key, required this.callBack, required this.isActive, required this.text})
      : super(key: key);
  final Function callBack;
  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Center(
        child: GestureDetector(
          onTap: () => callBack(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: MyColors.greanMain,
                borderRadius: BorderRadius.circular(15),
                boxShadow: isActive
                    ? [
                        const BoxShadow(
                            color: MyColors.greanSecond,
                            offset: Offset(2, 2),
                            blurRadius: 15,
                            spreadRadius: 1),
                        const BoxShadow(
                            color: MyColors.greanThird,
                            offset: Offset(-2, -2),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]
                    : null),
            child: Container(
              padding: EdgeInsets.all(8),
              child:  Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
