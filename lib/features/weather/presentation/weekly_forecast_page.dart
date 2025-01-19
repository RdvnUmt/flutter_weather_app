import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/data/weather_service.dart';
import 'package:weather_app/features/weather/domain/weather.dart';
import 'package:intl/intl.dart';

final weeklyForecastProvider = FutureProvider.family<List<Weather>, WeatherPosition>((ref, position) async {
  final weatherService = WeatherService();
  return weatherService.getWeeklyForecast(
    position.latitude,
    position.longitude,
  );
});

class WeatherPosition {
  final double latitude;
  final double longitude;

  WeatherPosition(this.latitude, this.longitude);
}

class WeeklyForecastPage extends ConsumerWidget {
  final WeatherPosition position;

  const WeeklyForecastPage({
    super.key,
    required this.position,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forecastAsync = ref.watch(weeklyForecastProvider(position));
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        title: const Text('Haftalık Tahmin', 
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: forecastAsync.when(
        data: (forecasts) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: forecasts.length,
          itemBuilder: (context, index) {
            final weather = forecasts[index];
            final date = DateTime.now().add(Duration(days: index));
            return _buildDayForecast(context, weather, date, theme);
          },
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hata: $error',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDayForecast(BuildContext context, Weather weather, DateTime date, ThemeData theme) {
    final color = _getWeatherColor(weather.description);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF2D2D2D),
            color.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE', 'tr_TR').format(date),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      DateFormat('d MMMM', 'tr_TR').format(date),
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${weather.temperature.toStringAsFixed(1)}°C',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildWeatherAnimation(weather.description),
                    const SizedBox(width: 8),
                    Text(
                      weather.description,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.water_drop, color: Colors.blue, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      '${weather.humidity}%',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherAnimation(String description) {
    IconData icon;
    Color color;

    switch (description.toLowerCase()) {
      case 'açık':
        icon = Icons.wb_sunny;
        color = Colors.orange;
        break;
      case 'az bulutlu':
        icon = Icons.cloud;
        color = Colors.grey;
        break;
      case 'parçalı bulutlu':
      case 'çok bulutlu':
      case 'kapalı':
        icon = Icons.cloud_queue;
        color = Colors.blueGrey;
        break;
      case 'yağmurlu':
      case 'sağanak yağışlı':
      case 'hafif yağmurlu':
      case 'orta şiddetli yağmur':
      case 'şiddetli yağmur':
      case 'çisenti':
        icon = Icons.grain;
        color = Colors.blue;
        break;
      case 'karlı':
        icon = Icons.ac_unit;
        color = Colors.lightBlue;
        break;
      case 'gök gürültülü fırtına':
        icon = Icons.flash_on;
        color = Colors.deepPurple;
        break;
      case 'sisli':
        icon = Icons.cloud;
        color = Colors.grey.shade400;
        break;
      default:
        icon = Icons.wb_sunny;
        color = Colors.orange;
    }

    return Icon(
      icon,
      size: 32,
      color: color.withOpacity(0.8),
    );
  }

  Color _getWeatherColor(String description) {
    switch (description.toLowerCase()) {
      case 'açık':
        return Colors.orange;
      case 'az bulutlu':
        return Colors.grey;
      case 'parçalı bulutlu':
      case 'çok bulutlu':
      case 'kapalı':
        return Colors.blueGrey;
      case 'yağmurlu':
      case 'sağanak yağışlı':
      case 'hafif yağmurlu':
      case 'orta şiddetli yağmur':
      case 'şiddetli yağmur':
      case 'çisenti':
        return Colors.blue;
      case 'karlı':
        return Colors.lightBlue;
      case 'gök gürültülü fırtına':
        return Colors.deepPurple;
      case 'sisli':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }
} 