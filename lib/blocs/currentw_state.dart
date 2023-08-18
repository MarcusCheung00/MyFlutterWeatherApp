//state that use on page

part of 'currentw_bloc.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

@JsonSerializable()
final class WeatherState extends Equatable {
  WeatherState({
    this.status = WeatherStatus.initial,
    this.updateat = 0,
    this.temperature = 0.0,
    this.description = '',
    this.city = '',
    this.country = '',
    this.lat = 0.0,
    this.lng = 0.0,
    this.icon = '',
    this.humidity = 0,
  });

  final WeatherStatus status;
  final int updateat;
  final double? temperature;
  final String description;
  final String city;
  final String country;
  final double lat;
  final double lng;
  final String icon;
  final int humidity;

  WeatherState copyWith({
    WeatherStatus? status,
    int? updateat,
    double? temperature,
    String? description,
    String? city,
    String? country,
    double? lat,
    double? lng,
    String? icon,
    int? humidity,
  }) {
    return WeatherState(
      status: status ?? this.status,
      updateat: updateat ?? this.updateat,
      temperature: temperature ?? this.temperature,
      description: description ?? this.description,
      city: city ?? this.city,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      icon: icon ?? this.icon,
      humidity: humidity ?? this.humidity,
    );
  }

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      status,
      updateat,
      temperature,
      description,
      city,
      country,
      lat,
      lng,
      icon,
      humidity,
    ];
  }
}
