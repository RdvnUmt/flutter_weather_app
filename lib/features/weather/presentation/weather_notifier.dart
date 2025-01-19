import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/weather/data/weather_service.dart';
import 'package:weather_app/features/weather/domain/weather.dart';

class WeatherNotifier extends StateNotifier<AsyncValue<Weather>> {
  final WeatherService _weatherService;

  WeatherNotifier(this._weatherService) : super(const AsyncValue.loading()) {
    getCurrentLocationWeather();
  }

  Future<void> getCurrentLocationWeather() async {
    try {
      state = const AsyncValue.loading();
      final position = await _determinePosition();
      final weather = await _weatherService.getWeatherByLocation(
        position.latitude,
        position.longitude,
      );
      state = AsyncValue.data(weather);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> getWeatherByLocation(double lat, double lon) async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherService.getWeatherByLocation(lat, lon);
      state = AsyncValue.data(weather);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> getWeatherByCity(String cityName) async {
    if (cityName.isEmpty) return;
    
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherService.getWeatherByCity(cityName);
      state = AsyncValue.data(weather);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Konum servisleri devre dışı.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Konum izni reddedildi.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Konum izinleri kalıcı olarak reddedildi.');
  }

  return await Geolocator.getCurrentPosition();
} 