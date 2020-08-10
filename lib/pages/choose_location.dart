import 'package:flutter/material.dart';
import 'package:world_clock/services/world_clock.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldClock> locations = [
    WorldClock(url:'Australia/Melbourne', location: 'Melbourne, Australia', flag: 'aus.png'),
    WorldClock(url:'Europe/London', location: 'London, UK', flag: 'uk.png'),
    WorldClock(url:'Asia/Tokyo', location: 'Tokyo, Japan', flag: 'japan.png'),
    WorldClock(url:'Asia/Colombo', location: 'Colombo, Sri Lanka', flag: 'sl.svg.png'),
    WorldClock(url:'Africa/Johannesburg', location: 'Johannesburg, South Africa', flag: 'sa.png'),
    WorldClock(url:'America/Chicago', location: 'Chicago, USA', flag: 'usa.png'),
  ];

  void updateTime(index) async{

    WorldClock clock = locations[index];
    await clock.getTime();

    //Navigate to Home Screen
    Navigator.pop(context, {

      'location': clock.location,
      'time': clock.time,
      'flag': clock.flag,
      'isDay': clock.isDay

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('imgs/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
