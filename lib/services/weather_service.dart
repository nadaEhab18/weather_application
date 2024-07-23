import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/models/weather_model.dart';

class WeatherService {
  String baseUrl = "https://api.weatherapi.com/v1";
  String apiKey = "24159db25e6b4f34ae2195456241307";
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try{
   Uri url =
   Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4");
   http.Response response = await http.get(url);
   Map<String, dynamic> data = jsonDecode(response.body);
   weather = WeatherModel.fromJson(data);
 }catch(e){
   print(e);
 }
 return weather;

  }
}
