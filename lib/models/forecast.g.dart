// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) =>
    ForecastResponse()
      ..cod = json['cod'] as String?
      ..message = json['message'] as int?
      ..cnt = json['cnt'] as int?
      ..list = (json['list'] as List<dynamic>?)
          ?.map((e) => ForecastList.fromJson(e as Map<String, dynamic>))
          .toList()
      ..city = json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>);

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

City _$CityFromJson(Map<String, dynamic> json) => City()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..coord = json['coord'] == null
      ? null
      : Coord.fromJson(json['coord'] as Map<String, dynamic>)
  ..country = json['country'] as String?
  ..population = json['population'] as int?
  ..timezone = json['timezone'] as int?;

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coord,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
    };

ForecastList _$ForecastListFromJson(Map<String, dynamic> json) => ForecastList()
  ..dt = json['dt'] as int?
  ..main = json['main'] == null
      ? null
      : Main.fromJson(json['main'] as Map<String, dynamic>)
  ..weather = (json['weather'] as List<dynamic>?)
      ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
      .toList()
  ..clouds = json['clouds'] == null
      ? null
      : Clouds.fromJson(json['clouds'] as Map<String, dynamic>)
  ..wind = json['wind'] == null
      ? null
      : Wind.fromJson(json['wind'] as Map<String, dynamic>)
  ..visibility = json['visibility'] as int?
  ..pop = (json['pop'] as num?)?.toDouble()
  ..sys = json['sys'] == null
      ? null
      : Sys.fromJson(json['sys'] as Map<String, dynamic>)
  ..dtTxt = json['dtTxt'] as String?;

Map<String, dynamic> _$ForecastListToJson(ForecastList instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys,
      'dtTxt': instance.dtTxt,
    };
