import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/domain/weather.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_icon.dart';

class HourlyForecastList extends StatelessWidget {
  final List<HourlyForecast> forecasts;

  const HourlyForecastList({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Saatlik Tahmin',
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: forecasts.length,
            itemBuilder: (context, index) {
              final hourly = forecasts[index];
              final now = DateTime.now();
              final isCurrentHour = hourly.time.hour == now.hour;
              
              return Container(
                width: 80,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isCurrentHour ? Colors.white10 : Colors.black26,
                  borderRadius: BorderRadius.circular(16),
                  border: isCurrentHour ? Border.all(
                    color: Colors.white24,
                    width: 1,
                  ) : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${hourly.time.hour.toString().padLeft(2, '0')}:00',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: isCurrentHour ? Colors.white : Colors.white70,
                        fontWeight: isCurrentHour ? FontWeight.bold : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    WeatherIcon(
                      description: hourly.description,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${hourly.temperature.toStringAsFixed(1)}°',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: isCurrentHour ? Colors.white : Colors.white70,
                        fontWeight: isCurrentHour ? FontWeight.bold : null,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
} 