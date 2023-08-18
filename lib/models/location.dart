import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  const Location({
    required this.id,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  final String country;
  final String city;
  final double latitude;
  final double longitude;
  final String id;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
