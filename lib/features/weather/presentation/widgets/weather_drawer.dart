import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/weather/data/weather_service.dart';
import 'package:weather_app/features/weather/presentation/weather_page.dart';
import 'package:weather_app/features/weather/presentation/weekly_forecast_page.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_detail_sheet.dart';

class WeatherDrawer extends ConsumerStatefulWidget {
  const WeatherDrawer({super.key});

  @override
  ConsumerState<WeatherDrawer> createState() => _WeatherDrawerState();
}

class _WeatherDrawerState extends ConsumerState<WeatherDrawer> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<Widget> _searchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Aramak istediğiniz şehri yazın',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ];
      });
      return;
    }

    try {
      final cities = await ref.read(weatherServiceProvider).searchCities(query);
      
      if (cities.isEmpty) {
        setState(() {
          _searchResults = [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Sonuç bulunamadı',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ];
        });
        return;
      }

      setState(() {
        _searchResults = cities.map((city) => ListTile(
          leading: const Icon(Icons.location_city, color: Colors.white70),
          title: Text(
            city.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: city.fullName != city.name ? Text(
            city.fullName,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ) : null,
          onTap: () {
            ref.read(weatherProvider.notifier).getWeatherByLocation(city.lat, city.lon);
            Navigator.pop(context);
          },
        )).toList();
      });
    } catch (e) {
      setState(() {
        _searchResults = [
          ListTile(
            leading: const Icon(Icons.error_outline, color: Colors.red),
            title: const Text(
              'Arama yapılırken bir hata oluştu',
              style: TextStyle(color: Colors.red),
            ),
            subtitle: Text(
              e.toString(),
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2D2D2D),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Şehir ara...',
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  suffixIcon: _searchController.text.isNotEmpty ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchResults = [];
                        _isSearching = false;
                      });
                    },
                  ) : null,
                  filled: true,
                  fillColor: const Color(0xFF3D3D3D),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  setState(() => _isSearching = true);
                  _performSearch(value);
                },
              ),
            ),
            if (_isSearching)
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: _searchResults,
                ),
              )
            else ...[
              ListTile(
                leading: const Icon(Icons.thermostat_outlined, color: Colors.white),
                title: const Text('Hava Detayları', style: TextStyle(color: Colors.white)),
                subtitle: const Text('Nem, rüzgar, basınç ve daha fazlası', 
                  style: TextStyle(color: Colors.white60, fontSize: 12)),
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: const Color(0xFF2D2D2D),
                    builder: (context) => ref.watch(weatherProvider).when(
                      data: (weather) => WeatherDetailSheet(weather: weather),
                      error: (_, __) => const SizedBox(),
                      loading: () => const Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.white),
                title: const Text('Haftalık Tahmin', style: TextStyle(color: Colors.white)),
                subtitle: const Text('7 günlük hava durumu tahmini', 
                  style: TextStyle(color: Colors.white60, fontSize: 12)),
                onTap: () async {
                  Navigator.pop(context);
                  final position = await _determinePosition();
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeeklyForecastPage(
                          position: WeatherPosition(
                            position.latitude,
                            position.longitude,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
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