import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for ui
  String time; // time in location
  String flag; // url to asset flag
  String url; // location ul for api
  bool isDaytime; // true for day false for night

  WorldTime ({this.location, this.flag, this.url, });

  Future <void> getTime() async{
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data ['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'Could Not Get Data';
    }




  }
}

