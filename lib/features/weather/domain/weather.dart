import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required double temperature,
    required double maxTemp,
    required double minTemp,
    required String description,
    required String icon,
    required String cityName,
    required int humidity,
    required double windSpeed,
    required double feelsLike,
    required int pressure,
    required double rainLastHour,
    required List<HourlyForecast> hourlyForecasts,
    Weather? tomorrowForecast,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required DateTime time,
    required double temperature,
    required String description,
    required String icon,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);
}

@freezed
class CitySearchResult with _$CitySearchResult {
  const factory CitySearchResult({
    required String name,
    required String fullName,
    required double lat,
    required double lon,
  }) = _CitySearchResult;

  factory CitySearchResult.fromJson(Map<String, dynamic> json) => _$CitySearchResultFromJson(json);
} 