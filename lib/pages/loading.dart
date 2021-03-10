
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getWeatherData()async{
    Weather weather = Weather(setcity: 'Mumbai');
    await weather.getData();

    Navigator.pushReplacementNamed(context,'/home',arguments:{
      'weather': weather.weather,
      'temp':weather.temp,
      'city':weather.city,
      'icon':weather.icon,

      //'code':weather.code,
      } );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
    body:SafeArea(
      child:Container(
          child: SpinKitCircle(
            color: Colors.orange[700],
            size: 100.0,
          ),

      ),
    )
    );
  }
}
