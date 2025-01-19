import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/weather.dart';

class WeatherDetailSheet extends StatelessWidget {
  final Weather weather;

  const WeatherDetailSheet({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Detaylı Bilgiler',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            'Hissedilen',
            '${weather.feelsLike.toStringAsFixed(1)}°C',
            Icons.thermostat,
          ),
          _buildDetailRow(
            'Nem',
            '${weather.humidity}%',
            Icons.water_drop,
          ),
          _buildDetailRow(
            'Rüzgar',
            '${weather.windSpeed} m/s',
            Icons.air,
          ),
          _buildDetailRow(
            'Basınç',
            '${weather.pressure} hPa',
            Icons.speed,
          ),
          _buildDetailRow(
            'Yağış (1s)',
            '${weather.rainLastHour} mm',
            Icons.umbrella,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(color: Colors.white70),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
} 