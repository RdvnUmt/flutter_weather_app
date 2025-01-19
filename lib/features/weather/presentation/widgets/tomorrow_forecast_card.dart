import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/weather.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_icon.dart';

class TomorrowForecastCard extends StatelessWidget {
  final Weather weather;

  const TomorrowForecastCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.wb_twilight,
            color: Colors.white70,
          ),
          const SizedBox(width: 8),
          Text(
            'Yarın',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white70,
            ),
          ),
          const Spacer(),
          WeatherIcon(
            description: weather.description,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '${weather.maxTemp.toStringAsFixed(1)}°↑ ${weather.minTemp.toStringAsFixed(1)}°↓',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
} 