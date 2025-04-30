import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _locationController = TextEditingController();
  final String apiKey = 'f26632ea1bff1b1e2b69aa24ca9cf0f1';

  String location = '';
  String temperature = '';
  String description = '';
  LatLng mapCenter = const LatLng(20.5937, 78.9629); // India center
  LatLng? markerPoint;

  Future<void> fetchWeatherByCity(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        location = data['name'];
        temperature = '${data['main']['temp'].round()}°C';
        description = data['weather'][0]['description'];
        markerPoint = LatLng(
          data['coord']['lat'],
          data['coord']['lon'],
        );
        log("markerPoint : $markerPoint");
      });
    }
  }

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        location = data['name'];
        temperature = '${data['main']['temp'].round()}°C';
        description = data['weather'][0]['description'];
        markerPoint = LatLng(lat, lon);
        log("markerPoint : $markerPoint");
      });
    }
  }

  @override
  void initState() {
    markerPoint = const LatLng(46.2291, 7.3594);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Check Weather',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _locationController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a city',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      fetchWeatherByCity(_locationController.text.trim());
                    },
                    child: const Text('Search'),
                  ),
                  const SizedBox(height: 20),
                  if (location.isNotEmpty)
                    Column(
                      children: [
                        Text(location, style: const TextStyle(fontSize: 20)),
                        Text(temperature, style: const TextStyle(fontSize: 18)),
                        Text(description, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FlutterMap(
                  options: MapOptions(
                    center: mapCenter,
                    zoom: 5,
                    onTap: (tapPosition, point) {
                      fetchWeatherByCoordinates(
                          point.latitude, point.longitude);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    if (markerPoint != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: markerPoint!,
                            width: 40,
                            height: 40,
                            child: const Icon(Icons.location_on,
                                color: Colors.red, size: 40),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
