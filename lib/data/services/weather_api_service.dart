import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skycast/features/weather/models/forecasting.dart';
import 'package:skycast/utils/constants/api_constants.dart';
import 'package:skycast/utils/helpers/helper_functions.dart';

class WeatherApiService extends GetxController {
  static WeatherApiService get instance => Get.find();

  // Varialbes
  final apiKey = WeatherApiConstants.apiKey;
  final baseUrl = WeatherApiConstants.baseUrl;
  final current = WeatherApiConstants.currentEndpoint;
  final forecast = WeatherApiConstants.forecastEndpoint;
  final history = WeatherApiConstants.currentEndpoint;

  // Return Forecast for the next 3 days
  // Future<WeatherForecast> fetchForcastingWeather(
  //     double lattitude, double longitude) async {
  //   try {
  //     const String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  //     final String q = '$lattitude,$longitude';
  //     final url = Uri.parse('$baseUrl?key=$apiKey&q=$q&days=3');

  //     final currentResponse = await http.get(
  //       url,
  //     );

  //     // Check StatusCode
  //     if (currentResponse.statusCode == 200) {
  //       final responseJson =
  //           jsonDecode(currentResponse.body) as Map<String, dynamic>;

  //       return WeatherForecast.fromJson(responseJson);
  //     } else {
  //       throw "Failed to load forecasting weather data!";
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Return Forecast for a given name
  Future<WeatherForecast> fetchForcastingWeather(String query) async {
    final String language = UHelperFunctions.detectLanguage(query);
    try {
      const String baseUrl = 'http://api.weatherapi.com/v1/forecast.json';
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
    const String baseUrl = 'http://api.weatherapi.com/v1/search.json';
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
