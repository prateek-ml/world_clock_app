import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock {

  String location;  //Location name
  String time;      //Current time in the location
  String flag;      //Path to the flag images
  String url;       //URL endpoint for the time API.
  bool isDay;      // Day time or not

  WorldClock({this.location, this.flag, this.url});

  Future <void> getTime() async {

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      int hrs = int.parse(offset.substring(1,3));
      int mins = int.parse(offset.substring(4,6));

      //Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: hrs, minutes: mins));

      //Format the datetime properly
      isDay = now.hour >= 6 && now.hour <= 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('Ooops!! Error occured from our side.');
      time = 'Could not fetch time data for you.';
    }

  }

}