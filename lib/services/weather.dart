import 'package:http/http.dart';
import 'dart:convert';

class Weather{
  String setcity;
  String weather;
  String temp;
  String city;
  //String code;
  String icon;
  Weather({this.setcity});

  Future<void> getData() async {
    Response response = await get('http://api.openweathermap.org/data/2.5/weather?q=$setcity&appid=d5b56fd07988143ae141503ed9d81742&units=metric');
    Map data = jsonDecode(response.body);

    weather = data['weather'][0]['main'];
    temp = data['main']['temp'].toString();
    city = data['name'];
    icon = data['weather'][0]['icon'];

      }
}