// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  double get temperature => throw _privateConstructorUsedError;
  double get maxTemp => throw _privateConstructorUsedError;
  double get minTemp => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get cityName => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;
  double get windSpeed => throw _privateConstructorUsedError;
  double get feelsLike => throw _privateConstructorUsedError;
  int get pressure => throw _privateConstructorUsedError;
  double get rainLastHour => throw _privateConstructorUsedError;
  List<HourlyForecast> get hourlyForecasts =>
      throw _privateConstructorUsedError;
  Weather? get tomorrowForecast => throw _privateConstructorUsedError;

  /// Serializes this Weather to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {double temperature,
      double maxTemp,
      double minTemp,
      String description,
      String icon,
      String cityName,
      int humidity,
      double windSpeed,
      double feelsLike,
      int pressure,
      double rainLastHour,
      List<HourlyForecast> hourlyForecasts,
      Weather? tomorrowForecast});

  $WeatherCopyWith<$Res>? get tomorrowForecast;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? maxTemp = null,
    Object? minTemp = null,
    Object? description = null,
    Object? icon = null,
    Object? cityName = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? feelsLike = null,
    Object? pressure = null,
    Object? rainLastHour = null,
    Object? hourlyForecasts = null,
    Object? tomorrowForecast = freezed,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      minTemp: null == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      rainLastHour: null == rainLastHour
          ? _value.rainLastHour
          : rainLastHour // ignore: cast_nullable_to_non_nullable
              as double,
      hourlyForecasts: null == hourlyForecasts
          ? _value.hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
      tomorrowForecast: freezed == tomorrowForecast
          ? _value.tomorrowForecast
          : tomorrowForecast // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ) as $Val);
  }

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherCopyWith<$Res>? get tomorrowForecast {
    if (_value.tomorrowForecast == null) {
      return null;
    }

    return $WeatherCopyWith<$Res>(_value.tomorrowForecast!, (value) {
      return _then(_value.copyWith(tomorrowForecast: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temperature,
      double maxTemp,
      double minTemp,
      String description,
      String icon,
      String cityName,
      int humidity,
      double windSpeed,
      double feelsLike,
      int pressure,
      double rainLastHour,
      List<HourlyForecast> hourlyForecasts,
      Weather? tomorrowForecast});

  @override
  $WeatherCopyWith<$Res>? get tomorrowForecast;
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? maxTemp = null,
    Object? minTemp = null,
    Object? description = null,
    Object? icon = null,
    Object? cityName = null,
    Object? humidity = null,
    Object? windSpeed = null,
    Object? feelsLike = null,
    Object? pressure = null,
    Object? rainLastHour = null,
    Object? hourlyForecasts = null,
    Object? tomorrowForecast = freezed,
  }) {
    return _then(_$WeatherImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      minTemp: null == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      rainLastHour: null == rainLastHour
          ? _value.rainLastHour
          : rainLastHour // ignore: cast_nullable_to_non_nullable
              as double,
      hourlyForecasts: null == hourlyForecasts
          ? _value._hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<HourlyForecast>,
      tomorrowForecast: freezed == tomorrowForecast
          ? _value.tomorrowForecast
          : tomorrowForecast // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.temperature,
      required this.maxTemp,
      required this.minTemp,
      required this.description,
      required this.icon,
      required this.cityName,
      required this.humidity,
      required this.windSpeed,
      required this.feelsLike,
      required this.pressure,
      required this.rainLastHour,
      required final List<HourlyForecast> hourlyForecasts,
      this.tomorrowForecast})
      : _hourlyForecasts = hourlyForecasts;

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final double temperature;
  @override
  final double maxTemp;
  @override
  final double minTemp;
  @override
  final String description;
  @override
  final String icon;
  @override
  final String cityName;
  @override
  final int humidity;
  @override
  final double windSpeed;
  @override
  final double feelsLike;
  @override
  final int pressure;
  @override
  final double rainLastHour;
  final List<HourlyForecast> _hourlyForecasts;
  @override
  List<HourlyForecast> get hourlyForecasts {
    if (_hourlyForecasts is EqualUnmodifiableListView) return _hourlyForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecasts);
  }

  @override
  final Weather? tomorrowForecast;

  @override
  String toString() {
    return 'Weather(temperature: $temperature, maxTemp: $maxTemp, minTemp: $minTemp, description: $description, icon: $icon, cityName: $cityName, humidity: $humidity, windSpeed: $windSpeed, feelsLike: $feelsLike, pressure: $pressure, rainLastHour: $rainLastHour, hourlyForecasts: $hourlyForecasts, tomorrowForecast: $tomorrowForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.rainLastHour, rainLastHour) ||
                other.rainLastHour == rainLastHour) &&
            const DeepCollectionEquality()
                .equals(other._hourlyForecasts, _hourlyForecasts) &&
            (identical(other.tomorrowForecast, tomorrowForecast) ||
                other.tomorrowForecast == tomorrowForecast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperature,
      maxTemp,
      minTemp,
      description,
      icon,
      cityName,
      humidity,
      windSpeed,
      feelsLike,
      pressure,
      rainLastHour,
      const DeepCollectionEquality().hash(_hourlyForecasts),
      tomorrowForecast);

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final double temperature,
      required final double maxTemp,
      required final double minTemp,
      required final String description,
      required final String icon,
      required final String cityName,
      required final int humidity,
      required final double windSpeed,
      required final double feelsLike,
      required final int pressure,
      required final double rainLastHour,
      required final List<HourlyForecast> hourlyForecasts,
      final Weather? tomorrowForecast}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  double get temperature;
  @override
  double get maxTemp;
  @override
  double get minTemp;
  @override
  String get description;
  @override
  String get icon;
  @override
  String get cityName;
  @override
  int get humidity;
  @override
  double get windSpeed;
  @override
  double get feelsLike;
  @override
  int get pressure;
  @override
  double get rainLastHour;
  @override
  List<HourlyForecast> get hourlyForecasts;
  @override
  Weather? get tomorrowForecast;

  /// Create a copy of Weather
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyForecast _$HourlyForecastFromJson(Map<String, dynamic> json) {
  return _HourlyForecast.fromJson(json);
}

/// @nodoc
mixin _$HourlyForecast {
  DateTime get time => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this HourlyForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyForecastCopyWith<HourlyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyForecastCopyWith<$Res> {
  factory $HourlyForecastCopyWith(
          HourlyForecast value, $Res Function(HourlyForecast) then) =
      _$HourlyForecastCopyWithImpl<$Res, HourlyForecast>;
  @useResult
  $Res call(
      {DateTime time, double temperature, String description, String icon});
}

/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res, $Val extends HourlyForecast>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyForecastImplCopyWith<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  factory _$$HourlyForecastImplCopyWith(_$HourlyForecastImpl value,
          $Res Function(_$HourlyForecastImpl) then) =
      __$$HourlyForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime time, double temperature, String description, String icon});
}

/// @nodoc
class __$$HourlyForecastImplCopyWithImpl<$Res>
    extends _$HourlyForecastCopyWithImpl<$Res, _$HourlyForecastImpl>
    implements _$$HourlyForecastImplCopyWith<$Res> {
  __$$HourlyForecastImplCopyWithImpl(
      _$HourlyForecastImpl _value, $Res Function(_$HourlyForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_$HourlyForecastImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyForecastImpl implements _HourlyForecast {
  const _$HourlyForecastImpl(
      {required this.time,
      required this.temperature,
      required this.description,
      required this.icon});

  factory _$HourlyForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyForecastImplFromJson(json);

  @override
  final DateTime time;
  @override
  final double temperature;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'HourlyForecast(time: $time, temperature: $temperature, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyForecastImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, temperature, description, icon);

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      __$$HourlyForecastImplCopyWithImpl<_$HourlyForecastImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyForecastImplToJson(
      this,
    );
  }
}

abstract class _HourlyForecast implements HourlyForecast {
  const factory _HourlyForecast(
      {required final DateTime time,
      required final double temperature,
      required final String description,
      required final String icon}) = _$HourlyForecastImpl;

  factory _HourlyForecast.fromJson(Map<String, dynamic> json) =
      _$HourlyForecastImpl.fromJson;

  @override
  DateTime get time;
  @override
  double get temperature;
  @override
  String get description;
  @override
  String get icon;

  /// Create a copy of HourlyForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyForecastImplCopyWith<_$HourlyForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CitySearchResult _$CitySearchResultFromJson(Map<String, dynamic> json) {
  return _CitySearchResult.fromJson(json);
}

/// @nodoc
mixin _$CitySearchResult {
  String get name => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  /// Serializes this CitySearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CitySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CitySearchResultCopyWith<CitySearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitySearchResultCopyWith<$Res> {
  factory $CitySearchResultCopyWith(
          CitySearchResult value, $Res Function(CitySearchResult) then) =
      _$CitySearchResultCopyWithImpl<$Res, CitySearchResult>;
  @useResult
  $Res call({String name, String fullName, double lat, double lon});
}

/// @nodoc
class _$CitySearchResultCopyWithImpl<$Res, $Val extends CitySearchResult>
    implements $CitySearchResultCopyWith<$Res> {
  _$CitySearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CitySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fullName = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitySearchResultImplCopyWith<$Res>
    implements $CitySearchResultCopyWith<$Res> {
  factory _$$CitySearchResultImplCopyWith(_$CitySearchResultImpl value,
          $Res Function(_$CitySearchResultImpl) then) =
      __$$CitySearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String fullName, double lat, double lon});
}

/// @nodoc
class __$$CitySearchResultImplCopyWithImpl<$Res>
    extends _$CitySearchResultCopyWithImpl<$Res, _$CitySearchResultImpl>
    implements _$$CitySearchResultImplCopyWith<$Res> {
  __$$CitySearchResultImplCopyWithImpl(_$CitySearchResultImpl _value,
      $Res Function(_$CitySearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of CitySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fullName = null,
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$CitySearchResultImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitySearchResultImpl implements _CitySearchResult {
  const _$CitySearchResultImpl(
      {required this.name,
      required this.fullName,
      required this.lat,
      required this.lon});

  factory _$CitySearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitySearchResultImplFromJson(json);

  @override
  final String name;
  @override
  final String fullName;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'CitySearchResult(name: $name, fullName: $fullName, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitySearchResultImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, fullName, lat, lon);

  /// Create a copy of CitySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CitySearchResultImplCopyWith<_$CitySearchResultImpl> get copyWith =>
      __$$CitySearchResultImplCopyWithImpl<_$CitySearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitySearchResultImplToJson(
      this,
    );
  }
}

abstract class _CitySearchResult implements CitySearchResult {
  const factory _CitySearchResult(
      {required final String name,
      required final String fullName,
      required final double lat,
      required final double lon}) = _$CitySearchResultImpl;

  factory _CitySearchResult.fromJson(Map<String, dynamic> json) =
      _$CitySearchResultImpl.fromJson;

  @override
  String get name;
  @override
  String get fullName;
  @override
  double get lat;
  @override
  double get lon;

  /// Create a copy of CitySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CitySearchResultImplCopyWith<_$CitySearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
