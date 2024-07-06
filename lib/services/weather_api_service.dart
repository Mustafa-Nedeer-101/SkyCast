import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skycast/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/api_constants.dart';
import 'package:skycast/utils/helpers/helper_functions.dart';

class WeatherApiService extends GetxController {
  static WeatherApiService get instance => Get.find();

  // Varialbes
  final apiKey = WeatherApiConstants.apiKey;
  final forecast = WeatherApiConstants.forecastBaseUrl;
  final cities = WeatherApiConstants.citiesBaseUrl;

  // Return Forecast for a given name
  Future<WeatherForecast> fetchForcastingWeather(String query) async {
    final String language = UHelperFunctions.detectLanguage(query);
    try {
      String baseUrl = forecast;
      final String q = query;
      final url = Uri.parse('$baseUrl?key=$apiKey&q=$q&lang=$language&days=3');

      final currentResponse = await http.get(
        url,
      );

      // Check StatusCode
      if (currentResponse.statusCode == 200) {
        final responseJson =
            jsonDecode(currentResponse.body) as Map<String, dynamic>;

        return WeatherForecast.fromJson(responseJson);
      } else {
        throw "Failed to load forecasting weather data!";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  // Return a search result of cities
  Future<List<Location>?> fetchSearchCities(String query) async {
    String baseUrl = cities;
    final String q = query;
    final url = Uri.parse('$baseUrl?key=$apiKey&q=$q');
    try {
      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => Location.fromJson(e)).toList();
      } else {
        throw 'Failed to load search results';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //
}
