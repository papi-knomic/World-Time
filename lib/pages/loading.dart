import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
void setupWorldTime() async{
  WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await worldTime.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': worldTime.location,
    'flag': worldTime.flag,
    'time': worldTime.time,
    'isDaytime': worldTime.isDaytime,
  });
}

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
   body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 90.0,
        )
   ),
    );
  }
}
