
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/pages/search_page.dart';
import 'package:weather_application/providers/weather_provider.dart';

class HomePage extends StatefulWidget {

   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void updateUi(){
    setState(() {

    });
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
   weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(

      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return   SearchPage(
                updateUi: updateUi,
              );
            }));
          }, icon: Icon(Icons.search),),
        ],
      ),
      body: weatherData == null? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("There is no weather 😔 \nStart searching now 🔍",
              style: TextStyle(
                fontSize: 25,
              ),)
          ],
        ),
      ) : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
               weatherData!.getThemeColor(),
              weatherData!.getThemeColor().shade300,
              weatherData!.getThemeColor().shade100,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),
            Text(Provider.of<WeatherProvider>(context).cityName!,
              //'Cairo'
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,),),
            Text(weatherData!.date
              ,style: TextStyle(fontSize: 22,),),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImageName()
                  //'assets/images/clear.png',
                ),
                Text('${weatherData!.temp.toInt()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,),),
                Column(
                  children: [
                    Text('max temp : ${weatherData!.maxTemp.toInt()}',style: TextStyle(fontSize: 22,),),
                    Text('min temp : ${weatherData!.minTemp.toInt()}',style: TextStyle(fontSize: 22,),),

                  ],
                ),
              ],
            ),
            const Spacer(),

            Text(
              weatherData!.weatherState.toString(),
              //'Clear'
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,),),
            const Spacer(flex: 5,),

          ],
        ),
      ),
    );
  }
}
