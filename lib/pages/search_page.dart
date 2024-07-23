
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/providers/weather_provider.dart';
import 'package:weather_application/services/weather_service.dart';



class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a City"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (data) async{
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel? weather = await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName=cityName!;
              Navigator.pop(context);

            },
            decoration: InputDecoration(
                hintText: "Enter a city",
                labelText: "Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 18)
            ),

          ),
        ),
      ),
    );
  }
}

