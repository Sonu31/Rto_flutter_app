
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rto_app/core/theme/colors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:speedometer/speedometer.dart';

class SpeedMeterScreen extends StatefulWidget{
  const SpeedMeterScreen({super.key});

  @override
    _SpeedMeterState createState() => _SpeedMeterState();
  }



class _SpeedMeterState  extends State<SpeedMeterScreen>{
  final PublishSubject<double> speedSubject = PublishSubject<double>(); // ✅ Use PublishSubject
  double speed = 50.0; // Initial Speed Value

  @override
  void dispose() {
    speedSubject.close(); // ✅ PublishSubject ko dispose karein
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: AppColors.background, appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text("SpeedoMeter"),leading:IconButton(onPressed:(){
      Navigator.pop(context); // Navigate back
    }, icon:Icon(Icons.arrow_back))

    ),
    body:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpeedOMeter(
          start: 0,               // Minimum Value
          end: 180,               // Maximum Value
          highlightStart: 60,      // Highlighted Region Start
          highlightEnd: 120,       // Highlighted Region End
          themeData: Theme.of(context), // Theme Data
          eventObservable: speedSubject, // Speed Value from Stream
        ),
        const SizedBox(height: 30),
        Slider(
          min: 0,
          max: 180,
          value: speed,
          onChanged: (value) {
            setState(() {
              speed = value;
            });
          },
        ),

  ]
    )
    );

  }


}