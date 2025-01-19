import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/data/weather_service.dart';
import 'package:weather_app/features/weather/domain/weather.dart';
import 'package:weather_app/features/weather/presentation/weather_notifier.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_content.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_drawer.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_detail_sheet.dart';

final weatherServiceProvider = Provider((ref) => WeatherService());

final weatherProvider = StateNotifierProvider<WeatherNotifier, AsyncValue<Weather>>((ref) {
  return WeatherNotifier(ref.watch(weatherServiceProvider));
});

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const WeatherDrawer(),
      body: weatherAsync.when(
        data: (weather) => WeatherContent(
          weather: weather,
          onRefresh: () {
            ref.read(weatherProvider.notifier).getCurrentLocationWeather();
          },
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hata: $error',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    ref.read(weatherProvider.notifier).getCurrentLocationWeather();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Tekrar Dene'),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
} 