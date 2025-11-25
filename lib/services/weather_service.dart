import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_api_flutter_app/models/weather.dart';

class WeatherService {
  static const String apiKey = "d1c67704f35a14487bbf7f2ae6400b30";
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric&lang=fr");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception("Ville non trouvée");
    }
  }
}
