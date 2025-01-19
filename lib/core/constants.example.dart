class Constants {
  static const String weatherApiBaseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String weatherApiKey = 'YOUR_API_KEY_HERE'; // OpenWeatherMap API anahtarınızı buraya ekleyin

  static const Map<String, String> weatherDescriptions = {
    'clear sky': 'Açık',
    'few clouds': 'Az Bulutlu',
    'scattered clouds': 'Parçalı Bulutlu',
    'broken clouds': 'Çok Bulutlu',
    'shower rain': 'Sağanak Yağışlı',
    'rain': 'Yağmurlu',
    'thunderstorm': 'Gök Gürültülü Fırtına',
    'snow': 'Karlı',
    'mist': 'Sisli',
    'overcast clouds': 'Kapalı',
    'light rain': 'Hafif Yağmurlu',
    'moderate rain': 'Orta Şiddetli Yağmur',
    'heavy intensity rain': 'Şiddetli Yağmur',
    'drizzle': 'Çisenti',
  };

  static String getWeatherDescription(String engDescription) {
    return weatherDescriptions[engDescription.toLowerCase()] ?? engDescription;
  }
} 