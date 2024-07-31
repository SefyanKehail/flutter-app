import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class Weather extends StatefulWidget {
  final String city;
  Weather(this.city);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<dynamic> weatherData = [];

  void getData(String url) {
    http.get(Uri.parse(url), headers: {'accept': 'application/json'}).then((resp) {
      setState(() {
        weatherData = json.decode(resp.body)['list'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    String url =
        'http://openweathermap.org/data/2.5/forecast?q=${widget.city}&appid=b6907d289e10d714a6e88b30761fae22';
    print(url);
    getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        backgroundColor: Colors.orange,
      ),
      body: (weatherData.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          var weather = weatherData[index]['weather'][0];
          var main = weatherData[index]['main'];
          var dateTime = DateTime.fromMillisecondsSinceEpoch(weatherData[index]['dt'] * 1000);

          return Card(
            color: Colors.deepOrangeAccent,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/${weather['main'].toLowerCase()}.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              DateFormat('E dd/MM/yyyy').format(dateTime),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${DateFormat('HH:mm').format(dateTime)} | ${weather['main']}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${main['temp'].round()} °C",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
