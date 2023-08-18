import 'package:json_annotation/json_annotation.dart';
import 'package:my_weather_app/models/unit.dart';
part 'forecast.g.dart';

@JsonSerializable()
class ForecastResponse {
  String? cod;
  int? message;
  int? cnt;
  List<ForecastList>? list;
  City? city;

  ForecastResponse();

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}

@JsonSerializable()
class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;

  City();

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

// @JsonSerializable()
// class Coord {
//   double? lat;
//   double? lon;

//   Coord();

//   factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
//   Map<String, dynamic> toJson() => _$CoordToJson(this);
// }

@JsonSerializable()
class ForecastList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  double? pop;
  Sys? sys;
  String? dtTxt;

  ForecastList();

  factory ForecastList.fromJson(Map<String, dynamic> json) =>
      _$ForecastListFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastListToJson(this);
}

// @JsonSerializable()
// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? seaLevel;
//   int? grndLevel;
//   int? humidity;
//   double? tempKf;

//   Main();

//   factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
//   Map<String, dynamic> toJson() => _$MainToJson(this);
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
// class Clouds {
//   int? all;

//   Clouds();

//   factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
//   Map<String, dynamic> toJson() => _$CloudsToJson(this);
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
// class Sys {
//   String? pod;

//   Sys();

//   factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
//   Map<String, dynamic> toJson() => _$SysToJson(this);
// }
