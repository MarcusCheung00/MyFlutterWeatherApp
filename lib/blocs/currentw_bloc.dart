import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_weather_app/api.dart';
import 'package:my_weather_app/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currentw_state.dart';
part 'currentw_bloc.g.dart';

sealed class CurrentEvent {}

final class FectchByName extends CurrentEvent {
  final String? cityname;
  FectchByName({this.cityname});
}

final class FectchByLocation extends CurrentEvent {
  final double lat;
  final double lng;
  FectchByLocation(this.lat, this.lng);
}

class CurrentWeatherBloc extends HydratedBloc<CurrentEvent, WeatherState> {
  CurrentWeatherBloc() : super(WeatherState()) {
    on<FectchByName>((event, emit) async {
      emit(state.copyWith(status: WeatherStatus.loading));
      try {
        WeatherResponse response =
            await OpenWeatherMapApiClient().getWeather(query: event.cityname);
        //TODO: convert response model to local state:
        //TODO: update state & wmit it
        emit(state.copyWith(
          status: WeatherStatus.success,
          temperature: response.main?.temp,
          description: response.weather?.first.description ?? '',
          city: response.name ?? '',
          country: response.sys?.country ?? '',
          lat: response.coord?.lat ?? 0.0,
          lng: response.coord?.lon ?? 0.0,
          icon: response.weather?.first.icon ?? '',
          humidity: response.main?.humidity ?? 0,
          updateat: DateTime.now().millisecondsSinceEpoch,
        ));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: WeatherStatus.failure));
      }
    });
    on<FectchByLocation>((event, emit) async {
      emit(state.copyWith(status: WeatherStatus.loading));
      try {
        WeatherResponse response = await OpenWeatherMapApiClient()
            .getWeather(latitude: event.lat, longitude: event.lng);
        emit(state.copyWith(
          status: WeatherStatus.success,
          temperature: response.main?.temp,
          description: response.weather?.first.description ?? '',
          city: response.name ?? '',
          country: response.sys?.country ?? '',
          lat: response.coord?.lat ?? 0.0,
          lng: response.coord?.lon ?? 0.0,
          icon: response.weather?.first.icon ?? '',
          humidity: response.main?.humidity ?? 0,
          updateat: DateTime.now().millisecondsSinceEpoch,
        ));
      } catch (e) {
        print(e);
        emit(state.copyWith(status: WeatherStatus.failure));
      }
    });
  }

  @override
  WeatherState fromJson(Map<String, dynamic> json) =>
      WeatherState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WeatherState state) => state.toJson();
}
