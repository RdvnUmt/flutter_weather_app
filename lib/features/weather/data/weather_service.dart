import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/features/weather/domain/weather.dart';
import 'dart:math' as math;

class WeatherService {
  Future<List<CitySearchResult>> searchCities(String query) async {
    if (query.isEmpty) return [];

    try {
      // Önce Türkiye şehirlerini ara
      final responseTR = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/geo/1.0/direct?q=$query,TR&limit=5&appid=${Constants.weatherApiKey}',
        ),
      );

      // Sonra global arama yap
      final responseGlobal = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/geo/1.0/direct?q=$query&limit=5&appid=${Constants.weatherApiKey}',
        ),
      );

      if (responseTR.statusCode == 200 && responseGlobal.statusCode == 200) {
        final List<dynamic> resultsTR = jsonDecode(responseTR.body);
        final List<dynamic> resultsGlobal = jsonDecode(responseGlobal.body);

        // Türkiye sonuçlarını işle
        final trCities = resultsTR.map((result) {
          // Türkçe ismi al veya varsayılan ismi kullan
          String name = result['local_names']?['tr'] ?? result['name'];
          
          // İlçe/semt bilgisini al
          String state = '';
          if (result['state'] != null) {
            state = result['state'];
            // Eğer state bir ilçe ise ve şehir İstanbul ise
            if (name == 'İstanbul') {
              name = state; // İlçe adını ana isim yap
              state = 'İstanbul'; // İstanbul'u state yap
            }
          }
          
          return CitySearchResult(
            name: _turkishLocalize(name),
            fullName: state.isNotEmpty 
              ? '${_turkishLocalize(name)}, ${_turkishLocalize(state)}'
              : _turkishLocalize(name),
            lat: result['lat'].toDouble(),
            lon: result['lon'].toDouble(),
          );
        }).toList();

        // Global sonuçları işle (Türkiye dışındaki)
        final globalCities = resultsGlobal.where((result) => 
          result['country'] != 'TR'
        ).map((result) {
          String name = result['local_names']?['tr'] ?? result['name'];
          String country = _getCountryName(result['country']);
          
          return CitySearchResult(
            name: name,
            fullName: '$name, $country',
            lat: result['lat'].toDouble(),
            lon: result['lon'].toDouble(),
          );
        }).toList();

        // Sonuçları birleştir ve tekrar edenleri filtrele
        final allCities = [...trCities, ...globalCities];
        final uniqueCities = allCities.fold<List<CitySearchResult>>([], (list, city) {
          if (!list.any((existing) => 
            existing.lat == city.lat && 
            existing.lon == city.lon
          )) {
            list.add(city);
          }
          return list;
        });

        return uniqueCities;
      } else {
        print('API Hatası TR: ${responseTR.statusCode} - ${responseTR.body}');
        print('API Hatası Global: ${responseGlobal.statusCode} - ${responseGlobal.body}');
        throw Exception('Şehir araması başarısız oldu');
      }
    } catch (e) {
      print('Şehir arama hatası: $e');
      throw Exception('Şehir araması başarısız oldu');
    }
  }

  // Türkçe karakterleri düzelt
  String _turkishLocalize(String text) {
    const turkishChars = {
      'i': 'i', 'ı': 'ı', 'ğ': 'ğ', 'ü': 'ü', 'ş': 'ş', 'ö': 'ö', 'ç': 'ç',
      'İ': 'İ', 'I': 'I', 'Ğ': 'Ğ', 'Ü': 'Ü', 'Ş': 'Ş', 'Ö': 'Ö', 'Ç': 'Ç'
    };

    return text.split('').map((char) => turkishChars[char] ?? char).join('');
  }

  // Ülke kodunu Türkçe isme çevir
  String _getCountryName(String countryCode) {
    const countries = {
      'US': 'Amerika Birleşik Devletleri',
      'GB': 'Birleşik Krallık',
      'DE': 'Almanya',
      'FR': 'Fransa',
      'IT': 'İtalya',
      'ES': 'İspanya',
      'GR': 'Yunanistan',
      'RU': 'Rusya',
      // Diğer ülkeler eklenebilir
    };

    return countries[countryCode] ?? countryCode;
  }

  Future<Weather> getWeatherByLocation(double lat, double lon) async {
    try {
      // Önce reverse geocoding ile tam konum bilgisini al
      final locationResponse = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&limit=1&appid=${Constants.weatherApiKey}',
        ),
      );

      String cityName = '';
      if (locationResponse.statusCode == 200) {
        final List<dynamic> locations = jsonDecode(locationResponse.body);
        if (locations.isNotEmpty) {
          final location = locations.first;
          final String name = location['local_names']?['tr'] ?? location['name'];
          final String state = location['state'] != null ? ', ${location['state']}' : '';
          cityName = _turkishLocalize('$name$state');
        }
      }

      final currentWeatherResponse = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${Constants.weatherApiKey}&units=metric&lang=tr',
        ),
      );

      final forecastResponse = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=${Constants.weatherApiKey}&units=metric&lang=tr',
        ),
      );

      if (currentWeatherResponse.statusCode == 200 && forecastResponse.statusCode == 200) {
        final Map<String, dynamic> currentJson = jsonDecode(currentWeatherResponse.body);
        final Map<String, dynamic> forecastJson = jsonDecode(forecastResponse.body);
        
        // Eğer reverse geocoding'den isim alamadıysak, weather API'den gelen ismi kullan
        if (cityName.isEmpty) {
          cityName = _turkishLocalize(currentJson['name']);
        }

        final List<dynamic> hourlyList = forecastJson['list'];
        final List<HourlyForecast> hourlyForecasts = [];
        Weather? tomorrowForecast;
        
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final tomorrow = today.add(const Duration(days: 1));

        // Bugünün tüm saatleri için tahmin oluştur
        for (int hour = 0; hour < 24; hour++) {
          final time = today.add(Duration(hours: hour));
          
          // API'den gelen en yakın saati bul
          Map<String, dynamic>? closestForecast;
          int minDifference = 24;

          for (var forecast in hourlyList) {
            final forecastTime = DateTime.fromMillisecondsSinceEpoch(forecast['dt'] * 1000);
            final difference = forecastTime.difference(time).inHours.abs();
            
            if (difference < minDifference) {
              minDifference = difference;
              closestForecast = forecast;
            }
          }

          if (closestForecast != null) {
            hourlyForecasts.add(HourlyForecast(
              time: time,
              temperature: closestForecast['main']['temp'].toDouble(),
              description: Constants.getWeatherDescription(closestForecast['weather'][0]['description']),
              icon: closestForecast['weather'][0]['icon'],
            ));
          }
        }

        // Yarının hava durumu için verileri topla
        var tomorrowForecasts = hourlyList.where((item) {
          final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
          return date.day == tomorrow.day;
        }).toList();

        if (tomorrowForecasts.isNotEmpty) {
          var tomorrowTemps = tomorrowForecasts.map((e) => e['main']['temp'].toDouble()).toList();
          var tomorrowMaxTemp = tomorrowTemps.reduce((a, b) => math.max<double>(a, b));
          var tomorrowMinTemp = tomorrowTemps.reduce((a, b) => math.min<double>(a, b));
          
          // Öğlen saatindeki hava durumunu al
          var tomorrowNoon = tomorrowForecasts.firstWhere(
            (item) {
              final date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
              return date.hour >= 12 && date.hour <= 15;
            },
            orElse: () => tomorrowForecasts.first,
          );

          tomorrowForecast = Weather(
            temperature: tomorrowNoon['main']['temp'].toDouble(),
            maxTemp: tomorrowMaxTemp,
            minTemp: tomorrowMinTemp,
            description: Constants.getWeatherDescription(tomorrowNoon['weather'][0]['description']),
            icon: tomorrowNoon['weather'][0]['icon'],
            cityName: cityName,
            humidity: tomorrowNoon['main']['humidity'],
            windSpeed: tomorrowNoon['wind']['speed'].toDouble(),
            feelsLike: tomorrowNoon['main']['feels_like'].toDouble(),
            pressure: tomorrowNoon['main']['pressure'],
            rainLastHour: ((tomorrowNoon['rain']?['3h'] ?? 0) / 3).toDouble(),
            hourlyForecasts: [],
            tomorrowForecast: null,
          );
        }

        return Weather(
          temperature: currentJson['main']['temp'].toDouble(),
          maxTemp: currentJson['main']['temp_max'].toDouble(),
          minTemp: currentJson['main']['temp_min'].toDouble(),
          description: Constants.getWeatherDescription(currentJson['weather'][0]['description']),
          icon: currentJson['weather'][0]['icon'],
          cityName: cityName,
          humidity: currentJson['main']['humidity'],
          windSpeed: currentJson['wind']['speed'].toDouble(),
          feelsLike: currentJson['main']['feels_like'].toDouble(),
          pressure: currentJson['main']['pressure'],
          rainLastHour: (currentJson['rain']?['1h'] ?? 0).toDouble(),
          hourlyForecasts: hourlyForecasts,
          tomorrowForecast: tomorrowForecast,
        );
      } else {
        print('API Hatası: ${currentWeatherResponse.statusCode} - ${currentWeatherResponse.body}');
        print('Forecast Hatası: ${forecastResponse.statusCode} - ${forecastResponse.body}');
        throw Exception('Hava durumu bilgisi alınamadı');
      }
    } catch (e) {
      print('Hava durumu hatası: $e');
      throw Exception('Hava durumu bilgisi alınamadı');
    }
  }

  Future<Weather> getWeatherByCity(String cityName) async {
    try {
      final currentWeatherResponse = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=${Constants.weatherApiKey}&units=metric&lang=tr',
        ),
      );

      if (currentWeatherResponse.statusCode == 200) {
        final Map<String, dynamic> currentJson = jsonDecode(currentWeatherResponse.body);
        
        // Koordinatları al ve saatlik tahminleri getir
        final lat = currentJson['coord']['lat'];
        final lon = currentJson['coord']['lon'];
        
        return getWeatherByLocation(lat, lon);
      } else if (currentWeatherResponse.statusCode == 404) {
        throw Exception('Şehir bulunamadı');
      } else {
        print('API Hatası: ${currentWeatherResponse.statusCode} - ${currentWeatherResponse.body}');
        throw Exception('Hava durumu bilgisi alınamadı');
      }
    } catch (e) {
      print('Şehir hava durumu hatası: $e');
      throw Exception('Hava durumu bilgisi alınamadı');
    }
  }

  Future<List<Weather>> getWeeklyForecast(double lat, double lon) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=${Constants.weatherApiKey}&units=metric&lang=tr',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> list = json['list'];
        final String cityName = json['city']['name'];

        // Her gün için bir hava durumu alıyoruz (5 günlük tahmin, 3 saatlik aralıklarla)
        final Map<String, Weather> dailyForecasts = {};

        for (var item in list) {
          final DateTime date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
          final String dateKey = '${date.year}-${date.month}-${date.day}';

          // Her gün için sadece öğlen saatindeki tahmini alıyoruz
          if (!dailyForecasts.containsKey(dateKey) && date.hour >= 12 && date.hour <= 15) {
            dailyForecasts[dateKey] = Weather(
              temperature: item['main']['temp'].toDouble(),
              maxTemp: item['main']['temp_max'].toDouble(),
              minTemp: item['main']['temp_min'].toDouble(),
              description: Constants.getWeatherDescription(item['weather'][0]['description']),
              icon: item['weather'][0]['icon'],
              cityName: cityName,
              humidity: item['main']['humidity'],
              windSpeed: item['wind']['speed'].toDouble(),
              feelsLike: item['main']['feels_like'].toDouble(),
              pressure: item['main']['pressure'],
              rainLastHour: ((item['rain']?['3h'] ?? 0) / 3).toDouble(),
              hourlyForecasts: [],
              tomorrowForecast: null,
            );
          }
        }

        return dailyForecasts.values.take(7).toList();
      } else {
        print('API Hatası: ${response.statusCode} - ${response.body}');
        throw Exception('Haftalık hava durumu bilgisi alınamadı');
      }
    } catch (e) {
      print('Haftalık tahmin hatası: $e');
      throw Exception('Haftalık hava durumu bilgisi alınamadı');
    }
  }
} 