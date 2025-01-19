// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      temperature: (json['temperature'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      minTemp: (json['minTemp'] as num).toDouble(),
      description: json['description'] as String,
      icon: json['icon'] as String,
      cityName: json['cityName'] as String,
      humidity: (json['humidity'] as num).toInt(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      feelsLike: (json['feelsLike'] as num).toDouble(),
      pressure: (json['pressure'] as num).toInt(),
      rainLastHour: (json['rainLastHour'] as num).toDouble(),
      hourlyForecasts: (json['hourlyForecasts'] as List<dynamic>)
          .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      tomorrowForecast: json['tomorrowForecast'] == null
          ? null
          : Weather.fromJson(json['tomorrowForecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'maxTemp': instance.maxTemp,
      'minTemp': instance.minTemp,
      'description': instance.description,
      'icon': instance.icon,
      'cityName': instance.cityName,
      'humidity': instance.humidity,
      'windSpeed': instance.windSpeed,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'rainLastHour': instance.rainLastHour,
      'hourlyForecasts': instance.hourlyForecasts,
      'tomorrowForecast': instance.tomorrowForecast,
    };

_$HourlyForecastImpl _$$HourlyForecastImplFromJson(Map<String, dynamic> json) =>
    _$HourlyForecastImpl(
      time: DateTime.parse(json['time'] as String),
      temperature: (json['temperature'] as num).toDouble(),
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$HourlyForecastImplToJson(
        _$HourlyForecastImpl instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temperature': instance.temperature,
      'description': instance.description,
      'icon': instance.icon,
    };

_$CitySearchResultImpl _$$CitySearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CitySearchResultImpl(
      name: json['name'] as String,
      fullName: json['fullName'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$CitySearchResultImplToJson(
        _$CitySearchResultImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fullName': instance.fullName,
      'lat': instance.lat,
      'lon': instance.lon,
    };
