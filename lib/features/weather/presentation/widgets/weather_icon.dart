import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String description;
  final double size;

  const WeatherIcon({
    super.key,
    required this.description,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
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
      size: size,
      color: color.withOpacity(0.8),
    );
  }
} 