// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class PercentIndicatorDemo extends StatefulWidget {
  @override
  _PercentIndicatorDemoState createState() => _PercentIndicatorDemoState();
}

class _PercentIndicatorDemoState extends State<PercentIndicatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Circular Percent Indicators"),
      ),
          body: Center(
        child: ListView(
            children: <Widget>[
              new CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 10.0,
                percent: 0.9,
                center: new Text(
                  "40 hours",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
        ]),
      ),
    );
  }
}