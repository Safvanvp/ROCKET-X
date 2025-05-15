import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyIntroduction extends StatefulWidget {
  final String conttent;
  final String animation;
  const MyIntroduction({
    required this.conttent,
    required this.animation,
  });

  @override
  State<MyIntroduction> createState() => _MyIntroductionState();
}

class _MyIntroductionState extends State<MyIntroduction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Lottie.asset(widget.animation)),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                //
                widget.conttent,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
