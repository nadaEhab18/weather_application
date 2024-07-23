import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/pages/home_page.dart';
import 'package:weather_application/providers/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null ? Colors.blue : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
