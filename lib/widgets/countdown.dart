import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../controller/controller.dart';

class CountdownWidget extends StatefulWidget {
  CountdownWidget({Key? key}) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 5,
      build: (BuildContext context, double time) => Text(
        formatedTime(time),
        textAlign: TextAlign.left,
        style: const TextStyle(
            color: Color(0xffffffff),
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14.0),
      ),
      interval: const Duration(milliseconds: 100),
      onFinished: () {
        setState(() {
          Provider.of<Controller>(context, listen: false).yourBoolVar =
              Provider.of<Controller>(context, listen: false).toggleBoolValue();
        });
      },
    );
  }

  String formatedTime(double secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime.toInt() % 60;

    String parsedTime =
        getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

    return parsedTime;
  }
}
