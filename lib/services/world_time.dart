import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for ui
  String time; // time in location
  String flag; // url to asset flag
  String url; // location ul for api
  var temp; // temp
  var description;
  var humidity;
  var windSpeed;
  var currently;
  bool isDaytime; // true for day false for night
  String api = '58b17bb08bbd5c01131464e8498481e9';

  WorldTime({
    this.location,
    this.flag,
    this.url,
    this.temp,
    this.humidity,
    this.description,
    this.windSpeed,
    this.currently,
  });

  Future<void> getWeather() async {
    try {
      Response response = await get(
          'http://api.openweathermap.org/data/2.5/weather?q=$location&units=Metric&appid=$api');
      var results = jsonDecode(response.body);
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    } catch (e) {
      print('caught error: $e');
      description = 'Could Not Get Data';
    }
  }

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'Could Not Get Data';
    }
  }
}
