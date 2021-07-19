
import 'package:http/http.dart';
import 'dart:convert';

class Weather{
  String setcity;
  String weather;
  String temp;
  String city;
  //String code;
  String icon;
  double long;
  double lat;

  Weather({this.setcity,this.lat,this.long});

  Future<void> getData() async {
    Response response = await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$setcity&appid=d5b56fd07988143ae141503ed9d81742&units=metric'));
    Map data = jsonDecode(response.body);

    weather = data['weather'][0]['main'];
    temp = data['main']['temp'].toString();
    city = data['name'];
    icon = data['weather'][0]['icon'];

  }
  Future<void> getDataFromLatLong() async {
    Response response = await get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=d5b56fd07988143ae141503ed9d81742&units=metric'));
    Map data = jsonDecode(response.body);

    weather = data['weather'][0]['main'];
    temp = data['main']['temp'].toString();
    city = data['name'];
    icon = data['weather'][0]['icon'];

  }
}