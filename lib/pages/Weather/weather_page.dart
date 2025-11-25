import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/models/weather.dart';
import 'package:github_api_flutter_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _controller = TextEditingController();

  Weather? _weather;
  bool _loading = false;
  String? _errorMessage;

  void searchWeather() async {
    final city = _controller.text.trim();
    if (city.isEmpty) return;

    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final result = await _weatherService.fetchWeather(city);
      setState(() {
        _weather = result;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Ville introuvable ";
      });
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Météo")),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔎 SEARCH BAR
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Entrez une ville...",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: searchWeather,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LOADER
            if (_loading)
              const CircularProgressIndicator(),

            // ERROR
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red, fontSize: 18)),

            // RESULT
            if (_weather != null && !_loading)
              Column(
                children: [
                  const SizedBox(height: 20),

                  Text(
                    _weather!.city,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Image.network(
                    "https://openweathermap.org/img/wn/${_weather!.icon}@2x.png",
                    width: 100,
                  ),

                  Text(
                    "${_weather!.temperature}°C",
                    style: const TextStyle(fontSize: 48, color: Colors.blue),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _weather!.description,
                    style: const TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
