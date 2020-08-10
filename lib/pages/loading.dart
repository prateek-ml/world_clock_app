import 'package:flutter/material.dart';
import 'package:world_clock/services/world_clock.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldClock() async{

    WorldClock clock = WorldClock(
      location: 'Kolkata, India',
      flag: 'assets/imgs/flags/germany.png',
      url: 'Asia/Kolkata'
    );
    await clock.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': clock.location,
      'time': clock.time,
      'flag': clock.flag,
      'isDay': clock.isDay
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldClock();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitRing(
          color: Colors.grey[200],
          size: 80.0,
        ),
      )
    );
  }
}
