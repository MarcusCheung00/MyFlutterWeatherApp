import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_weather_app/model.dart';

/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when Param NotEnough fails.
class ParamNotEnoughFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

/// {@template open_meteo_api_client}
/// Dart API Client which wraps the [Open Meteo API](https://open-meteo.com).
/// {@endtemplate}
class OpenWeatherMapApiClient {
  /// {@macro open_meteo_api_client}
  OpenWeatherMapApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlWeather = 'api.openweathermap.org';

  final http.Client _httpClient;

  Future<WeatherResponse> getWeather({
    double? latitude,
    double? longitude,
    String? query,
  }) async {
    bool ready = false;

    final queryParams = <String, String>{
      'APPID': '3a5c72907d448d86b51c43f92ec6b20d',
      'units': 'metric'
    };
    //check if geolocation is valid
    if (latitude != null && longitude != null) {
      queryParams['lat'] = '$latitude';
      queryParams['lon'] = '$longitude';
      ready = true;
    }
    //check if query string is not empty
    if (query != null && query.isNotEmpty) {
      queryParams['q'] = '$query';
      ready = true;
    }
    Uri weatherRequest =
        Uri.https(_baseUrlWeather, '/data/2.5/weather', queryParams);

    if (!ready) {
      throw ParamNotEnoughFailure();
    }

    final weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('weather')) {
      throw WeatherNotFoundFailure();
    }

    return WeatherResponse.fromJson(bodyJson);
  }
}
