import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '3ad1d1dcada525ae3badf83820068b68';
const String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

Future<Map<String, dynamic>> getWeather(String city) async {
  try {
    final response = await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

void main() async {
  const String city = 'Almaty';

  try {
    final weatherData = await getWeather(city);
    print('Weather in $city: $weatherData');
  } catch (e) {
    print('Error: $e');
  }
}
