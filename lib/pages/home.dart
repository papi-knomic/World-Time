import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isDaytime'] == true ? 'day.png' : 'night.png';
    Color bgColor =
        data['isDaytime'] == true ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                        'temp': result['temp'],
                        'description': result['description'],
                        'currently': result['currently'],
                        'humidity': result['humidity'],
                        'windSpeed': result['windSpeed'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: data['isDaytime'] == true
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: data['isDaytime'] == true
                            ? Colors.black
                            : Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color:
                        data['isDaytime'] == true ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.thermometerHalf,
                            color: data['isDaytime'] == true
                                ? Colors.black
                                : Colors.white,
                          ),
                          title: Text(
                            'Temperature',
                            style: TextStyle(
                                color: data['isDaytime'] == true
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          trailing: Text(
                              data['temp'] != null
                                  ? data['temp'].toString() + '\u0000'
                                  : 'Loading',
                              style: TextStyle(
                                  color: data['isDaytime'] == true
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.cloud,
                            color: data['isDaytime'] == true
                                ? Colors.black
                                : Colors.white,
                          ),
                          title: Text(
                            'Weather',
                            style: TextStyle(
                                color: data['isDaytime'] == true
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          trailing: Text(
                              data['description'] != null
                                  ? data['description'].toString()
                                  : 'Loading',
                              style: TextStyle(
                                  color: data['isDaytime'] == true
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(
                            data['isDaytime'] == true
                                ? FontAwesomeIcons.sun
                                : FontAwesomeIcons.moon,
                            color: data['isDaytime'] == true
                                ? Colors.amber
                                : Colors.white,
                          ),
                          title: Text(
                            'Currently',
                            style: TextStyle(
                                color: data['isDaytime'] == true
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          trailing: Text(
                              data['currently'] != null
                                  ? data['currently'].toString()
                                  : 'Loading',
                              style: TextStyle(
                                  color: data['isDaytime'] == true
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(
                            data['isDaytime'] == true
                                ? FontAwesomeIcons.sun
                                : FontAwesomeIcons.moon,
                            color: data['isDaytime'] == true
                                ? Colors.amber
                                : Colors.white,
                          ),
                          title: Text(
                            'Humidity',
                            style: TextStyle(
                                color: data['isDaytime'] == true
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          trailing: Text(
                              data['humidity'] != null
                                  ? data['humidity'].toString()
                                  : 'Loading',
                              style: TextStyle(
                                  color: data['isDaytime'] == true
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.wind,
                            color: data['isDaytime'] == true
                                ? Colors.black
                                : Colors.white,
                          ),
                          title: Text(
                            'Wind Speed',
                            style: TextStyle(
                                color: data['isDaytime'] == true
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          trailing: Text(
                              data['windSpeed'] != null
                                  ? data['WindSpeed'].toString()
                                  : 'Loading',
                              style: TextStyle(
                                  color: data['isDaytime'] == true
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
