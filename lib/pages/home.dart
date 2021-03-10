import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[900],
       body: SafeArea(
         child: Center(
           child: Column(
             children: [
               Padding(
                 padding: EdgeInsets.only(top: 80.0,bottom: 10.0,left: 10.0,right: 10.0),
                 child: TextField(
                   style: TextStyle(
                     color: Colors.white
                   ),
                   onSubmitted: (String text)async{
                     print(text);
                     Weather weather = Weather(setcity: text);
                     await weather.getData();

                     setState(() {
                        data = {
                          'temp':weather.temp,
                          'weather':weather.weather,
                          'city':weather.city,
                          //'code':weather.code,
                          'icon':weather.icon,
                       };
                       print(data);
                     });
                   },
                   decoration: InputDecoration(
                     hintText: 'Search City Name',
                       hintStyle: TextStyle(
                         color: Colors.grey[700]
                       ),
                       focusedBorder:UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white,)
                       )
                   ),

                 ),
               ),
               Padding(
                 padding: const  EdgeInsets.only(top: 10.0),
                 child: Text(
                   data['temp']+'°C',
                   style: TextStyle(
                     fontSize: 80.0,
                     color: Colors.orange[600],
                   ),
                 ),
               ),
               Center(
                 child: Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Image(image: AssetImage('icons/${data['icon']}.png')),
                       Padding(
                         padding: const  EdgeInsets.only(top: 6.0),
                         child: Text(
                           data['weather'],
                           style: TextStyle(
                             fontSize: 50.0,
                             color: Colors.orange[600],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 6.0),
                 child: Text(
                   data['city'],
                   style: TextStyle(
                     fontSize: 30.0,
                     color: Colors.orange[600],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),

    );
  }
}
