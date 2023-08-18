//model that represents the income weather data
import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/models/unit.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherResponse {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherResponse();

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

// @JsonSerializable()
// class Coord {
//   double? lon;
//   double? lat;

//   Coord();

//   factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
//   Map<String, dynamic> toJson() => _$CoordToJson(this);
// }

// @JsonSerializable()
// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;

//   Weather();

//   factory Weather.fromJson(Map<String, dynamic> json) =>
//       _$WeatherFromJson(json);
//   Map<String, dynamic> toJson() => _$WeatherToJson(this);
// }

// @JsonSerializable()
// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? humidity;

//   Main();

//   factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
//   Map<String, dynamic> toJson() => _$MainToJson(this);
// }

// @JsonSerializable()
// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;

//   Wind();

//   factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
//   Map<String, dynamic> toJson() => _$WindToJson(this);
// }

// @JsonSerializable()
// class Clouds {
//   int? all;

//   Clouds();

//   factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
//   Map<String, dynamic> toJson() => _$CloudsToJson(this);
// }

// @JsonSerializable()
// class Sys {
//   int? type;
//   int? id;
//   String? country;
//   int? sunrise;
//   int? sunset;

//   Sys();

//   factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
//   Map<String, dynamic> toJson() => _$SysToJson(this);
// }
