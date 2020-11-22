import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<TimerInfo>(
          create: (_) => TimerInfo(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      Provider.of<TimerInfo>(context, listen: false).updateDateTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var timerProvider = Provider.of<TimerInfo>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is a text widget \n it is not getting rebuild as the time is changing",
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hour ->  ',
                        textScaleFactor: 1.8,
                      ),
                      Text(
                        'Min ->  ',
                        textScaleFactor: 1.8,
                      ),
                      Text(
                        'Sec ->  ',
                        textScaleFactor: 1.8,
                      ),
                    ],
                  ),
                  Text(
                    "${timerProvider.time.hour} \n${timerProvider.time.minute} \n${timerProvider.time.second} "
                        //"\n${timerProvider.time.millisecond}"
                        .toString(),
                    textScaleFactor: 1.8,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerInfo with ChangeNotifier {
  DateTime time;

  /// getter method
  DateTime getTime() => time;

  /// function to display current time
  updateDateTime() {
    time = DateTime.now();
    notifyListeners();
  }
}
