import 'dart:async';

import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stopwatch_app/shared/components/components.dart';
import 'package:stopwatch_app/shared/style/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool isRunning = false;
  Duration elapsed = Duration.zero;
  Timer? timer;

  void start() {
    if (!isRunning) {
      setState(() {
        isRunning = true;
        timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
          setState(() {
            elapsed += const Duration(milliseconds: 1);
          });
        });
      });
    }
  }

  void pause() {
    if (isRunning) {
      setState(() {
        isRunning = false;
        timer?.cancel();
      });
    }
  }

  void reset() {
    setState(() {
      isRunning = false;
      elapsed = Duration.zero;
      timer?.cancel();
    });
  }

  String formatMinutes(Duration d) {
    int minutes = d.inMinutes;
    return minutes.toString().padLeft(2, '0');
  }

  String formatSeconds(Duration d) {
    int seconds = d.inSeconds.remainder(60);
    return seconds.toString().padLeft(2, '0');
  }

  String formatMilliseconds(Duration d) {
    int milliseconds = d.inMilliseconds.remainder(1000) ~/ 10;  // Divide by 10 to get two digits
    return milliseconds.toString().padLeft(2, '0');
  }



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: color4.withOpacity(0.7),
        centerTitle: true,
        title: const Text(
          'Stopwatch',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color4.withOpacity(0.6),
        onPressed: () {  },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              defaultButton(
                text: 'Start',
                onPressed: (){
                  start();
                },
              ),
              defaultButton(
                text: 'Pause',
                onPressed: (){
                  pause();
                },
              ),
              defaultButton(
                text: 'Reset',
                onPressed: (){
                  reset();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultText(text: 'Minutes'),
                    SizedBox(height: 5.h,),
                    defaultTime(text: formatMinutes(elapsed)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultText(text: 'Seconds'),
                    SizedBox(height: 5.h,),
                    defaultTime(text: formatSeconds(elapsed)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultText(text: 'Millis'),
                    SizedBox(height: 5.h,),
                    defaultTime(text: formatMilliseconds(elapsed)),
                  ],
                ),
              ]
            ),
            SizedBox(height: 50.h,),

          ],
        ),
      ),
    );
  }
}
