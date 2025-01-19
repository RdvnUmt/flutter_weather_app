# Flutter Hava Durumu Uygulaması

Modern ve kullanıcı dostu bir hava durumu uygulaması. OpenWeatherMap API'sini kullanarak güncel hava durumu bilgilerini gösterir.

## Özellikler

- 🌡️ Anlık hava durumu bilgileri
- 🕒 24 saatlik tahmin
- 📅 Haftalık tahmin
- 🔍 Şehir arama
- 📍 Konum bazlı hava durumu

## Kurulum

1. Projeyi klonlayın:
```bash
git clone https://github.com/[kullanıcı-adınız]/flutter_weather_app.git
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. API anahtarını ayarlayın:
   - `lib/core/constants.example.dart` dosyasını `lib/core/constants.dart` olarak kopyalayın
   - `weatherApiKey` değişkenine OpenWeatherMap API anahtarınızı ekleyin

4. Uygulamayı çalıştırın:
```bash
flutter run
```

## Kullanılan Teknolojiler

- Flutter
- Riverpod (State Management)
- OpenWeatherMap API
- Freezed (Code Generation)
- HTTP

## Katkıda Bulunma

1. Bu depoyu fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Bir Pull Request oluşturun

## Lisans

Bu proje MIT lisansı altında lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## İletişim

[Adınız] - [@twitter_handle](https://twitter.com/twitter_handle) - email@example.com

Proje Linki: [https://github.com/[kullanıcı-adınız]/flutter_weather_app](https://github.com/[kullanıcı-adınız]/flutter_weather_app)
