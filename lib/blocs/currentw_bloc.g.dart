// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentw_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) => WeatherState(
      status: $enumDecodeNullable(_$WeatherStatusEnumMap, json['status']) ??
          WeatherStatus.initial,
      updateat: json['updateat'] as int? ?? 0,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      icon: json['icon'] as String? ?? '',
      humidity: json['humidity'] as int? ?? 0,
    );

Map<String, dynamic> _$WeatherStateToJson(WeatherState instance) =>
    <String, dynamic>{
      'status': _$WeatherStatusEnumMap[instance.status]!,
      'updateat': instance.updateat,
      'temperature': instance.temperature,
      'description': instance.description,
      'city': instance.city,
      'country': instance.country,
      'lat': instance.lat,
      'lng': instance.lng,
      'icon': instance.icon,
      'humidity': instance.humidity,
    };

const _$WeatherStatusEnumMap = {
  WeatherStatus.initial: 'initial',
  WeatherStatus.loading: 'loading',
  WeatherStatus.success: 'success',
  WeatherStatus.failure: 'failure',
};
