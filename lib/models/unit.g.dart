// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord()
  ..lon = (json['lon'] as num?)?.toDouble()
  ..lat = (json['lat'] as num?)?.toDouble();

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main()
  ..temp = (json['temp'] as num?)?.toDouble()
  ..feelsLike = (json['feelsLike'] as num?)?.toDouble()
  ..tempMin = (json['tempMin'] as num?)?.toDouble()
  ..tempMax = (json['tempMax'] as num?)?.toDouble()
  ..pressure = json['pressure'] as int?
  ..humidity = json['humidity'] as int?;

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather()
  ..id = json['id'] as int?
  ..main = json['main'] as String?
  ..description = json['description'] as String?
  ..icon = json['icon'] as String?;

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) =>
    Clouds()..all = json['all'] as int?;

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.all,
    };

Wind _$WindFromJson(Map<String, dynamic> json) => Wind()
  ..speed = (json['speed'] as num?)?.toDouble()
  ..deg = json['deg'] as int?
  ..gust = (json['gust'] as num?)?.toDouble();

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

Sys _$SysFromJson(Map<String, dynamic> json) => Sys()
  ..type = json['type'] as int?
  ..id = json['id'] as int?
  ..country = json['country'] as String?
  ..sunrise = json['sunrise'] as int?
  ..sunset = json['sunset'] as int?;

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
