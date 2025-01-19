import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/weather.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_icon.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_forecast_list.dart';
import 'package:weather_app/features/weather/presentation/widgets/tomorrow_forecast_card.dart';

class WeatherContent extends StatelessWidget {
  final Weather weather;
  final VoidCallback onRefresh;

  const WeatherContent({
    super.key,
    required this.weather,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1F1F1F),
            _getWeatherColor(weather.description).withOpacity(0.6),
          ],
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                WeatherIcon(description: weather.description),
                const SizedBox(height: 24),
                Text(
                  weather.cityName,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather.temperature.toStringAsFixed(1),
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      '°C',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Text(
                  weather.description,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '↑${weather.maxTemp.toStringAsFixed(1)}°',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '↓${weather.minTemp.toStringAsFixed(1)}°',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                if (weather.tomorrowForecast != null) ...[
                  const SizedBox(height: 32),
                  TomorrowForecastCard(weather: weather.tomorrowForecast!),
                ],
                const SizedBox(height: 32),
                HourlyForecastList(forecasts: weather.hourlyForecasts),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              backgroundColor: _getWeatherColor(weather.description),
              onPressed: onRefresh,
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),
        ],
      ),
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