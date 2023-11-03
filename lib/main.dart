import 'package:flutter/material.dart';
import 'WeatherModelData.dart';
import 'weatherData.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

  List<WeatherModelData> posts = List.empty(growable:  true) ;



  @override
  void initState() {
    super.initState();
    getWeatherData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Information'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final cityInfo = posts[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                  ),
            child: ListTile(
              title: Text('City: ${cityInfo.city}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temperature: ${cityInfo.temperature}°C'),
                  Text('Condition: ${cityInfo.condition}'),
                  Text('Humidity: ${cityInfo.humidity}%'),
                  Text('Wind Speed: ${cityInfo.windSpeed} m/s'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void getWeatherData(){
   var weather_data =  weatherData.data;
   Iterable l = json.decode(weather_data);
  posts = List<WeatherModelData>.from(l.map((model)=> WeatherModelData.fromJson(model)));

   print(posts.toString());
  setState(() {

  });
  }
}
