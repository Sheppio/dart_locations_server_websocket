// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationReport _$LocationReportFromJson(Map<String, dynamic> json) {
  return _LocationReport.fromJson(json);
}

/// @nodoc
mixin _$LocationReport {
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get elevation => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  double? get heading => throw _privateConstructorUsedError;
  double? get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationReportCopyWith<LocationReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationReportCopyWith<$Res> {
  factory $LocationReportCopyWith(
          LocationReport value, $Res Function(LocationReport) then) =
      _$LocationReportCopyWithImpl<$Res>;
  $Res call(
      {DateTime timestamp,
      String id,
      double latitude,
      double longitude,
      double? elevation,
      double? accuracy,
      double? heading,
      double? speed});
}

/// @nodoc
class _$LocationReportCopyWithImpl<$Res>
    implements $LocationReportCopyWith<$Res> {
  _$LocationReportCopyWithImpl(this._value, this._then);

  final LocationReport _value;
  // ignore: unused_field
  final $Res Function(LocationReport) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? id = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? elevation = freezed,
    Object? accuracy = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      elevation: elevation == freezed
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_LocationReportCopyWith<$Res>
    implements $LocationReportCopyWith<$Res> {
  factory _$$_LocationReportCopyWith(
          _$_LocationReport value, $Res Function(_$_LocationReport) then) =
      __$$_LocationReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime timestamp,
      String id,
      double latitude,
      double longitude,
      double? elevation,
      double? accuracy,
      double? heading,
      double? speed});
}

/// @nodoc
class __$$_LocationReportCopyWithImpl<$Res>
    extends _$LocationReportCopyWithImpl<$Res>
    implements _$$_LocationReportCopyWith<$Res> {
  __$$_LocationReportCopyWithImpl(
      _$_LocationReport _value, $Res Function(_$_LocationReport) _then)
      : super(_value, (v) => _then(v as _$_LocationReport));

  @override
  _$_LocationReport get _value => super._value as _$_LocationReport;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? id = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? elevation = freezed,
    Object? accuracy = freezed,
    Object? heading = freezed,
    Object? speed = freezed,
  }) {
    return _then(_$_LocationReport(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      elevation: elevation == freezed
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: accuracy == freezed
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      heading: heading == freezed
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocationReport implements _LocationReport {
  const _$_LocationReport(
      {required this.timestamp,
      required this.id,
      required this.latitude,
      required this.longitude,
      this.elevation,
      this.accuracy,
      this.heading,
      this.speed});

  factory _$_LocationReport.fromJson(Map<String, dynamic> json) =>
      _$$_LocationReportFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final String id;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? elevation;
  @override
  final double? accuracy;
  @override
  final double? heading;
  @override
  final double? speed;

  @override
  String toString() {
    return 'LocationReport(timestamp: $timestamp, id: $id, latitude: $latitude, longitude: $longitude, elevation: $elevation, accuracy: $accuracy, heading: $heading, speed: $speed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationReport &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.elevation, elevation) &&
            const DeepCollectionEquality().equals(other.accuracy, accuracy) &&
            const DeepCollectionEquality().equals(other.heading, heading) &&
            const DeepCollectionEquality().equals(other.speed, speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(elevation),
      const DeepCollectionEquality().hash(accuracy),
      const DeepCollectionEquality().hash(heading),
      const DeepCollectionEquality().hash(speed));

  @JsonKey(ignore: true)
  @override
  _$$_LocationReportCopyWith<_$_LocationReport> get copyWith =>
      __$$_LocationReportCopyWithImpl<_$_LocationReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationReportToJson(this);
  }
}

abstract class _LocationReport implements LocationReport {
  const factory _LocationReport(
      {required final DateTime timestamp,
      required final String id,
      required final double latitude,
      required final double longitude,
      final double? elevation,
      final double? accuracy,
      final double? heading,
      final double? speed}) = _$_LocationReport;

  factory _LocationReport.fromJson(Map<String, dynamic> json) =
      _$_LocationReport.fromJson;

  @override
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  double? get elevation => throw _privateConstructorUsedError;
  @override
  double? get accuracy => throw _privateConstructorUsedError;
  @override
  double? get heading => throw _privateConstructorUsedError;
  @override
  double? get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LocationReportCopyWith<_$_LocationReport> get copyWith =>
      throw _privateConstructorUsedError;
}

AllLocationsReport _$AllLocationsReportFromJson(Map<String, dynamic> json) {
  return _AllLocationsReport.fromJson(json);
}

/// @nodoc
mixin _$AllLocationsReport {
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, LocationReport> get locations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllLocationsReportCopyWith<AllLocationsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllLocationsReportCopyWith<$Res> {
  factory $AllLocationsReportCopyWith(
          AllLocationsReport value, $Res Function(AllLocationsReport) then) =
      _$AllLocationsReportCopyWithImpl<$Res>;
  $Res call({DateTime timestamp, Map<String, LocationReport> locations});
}

/// @nodoc
class _$AllLocationsReportCopyWithImpl<$Res>
    implements $AllLocationsReportCopyWith<$Res> {
  _$AllLocationsReportCopyWithImpl(this._value, this._then);

  final AllLocationsReport _value;
  // ignore: unused_field
  final $Res Function(AllLocationsReport) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locations: locations == freezed
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as Map<String, LocationReport>,
    ));
  }
}

/// @nodoc
abstract class _$$_AllLocationsReportCopyWith<$Res>
    implements $AllLocationsReportCopyWith<$Res> {
  factory _$$_AllLocationsReportCopyWith(_$_AllLocationsReport value,
          $Res Function(_$_AllLocationsReport) then) =
      __$$_AllLocationsReportCopyWithImpl<$Res>;
  @override
  $Res call({DateTime timestamp, Map<String, LocationReport> locations});
}

/// @nodoc
class __$$_AllLocationsReportCopyWithImpl<$Res>
    extends _$AllLocationsReportCopyWithImpl<$Res>
    implements _$$_AllLocationsReportCopyWith<$Res> {
  __$$_AllLocationsReportCopyWithImpl(
      _$_AllLocationsReport _value, $Res Function(_$_AllLocationsReport) _then)
      : super(_value, (v) => _then(v as _$_AllLocationsReport));

  @override
  _$_AllLocationsReport get _value => super._value as _$_AllLocationsReport;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? locations = freezed,
  }) {
    return _then(_$_AllLocationsReport(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locations: locations == freezed
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as Map<String, LocationReport>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AllLocationsReport implements _AllLocationsReport {
  _$_AllLocationsReport(
      {required this.timestamp,
      required final Map<String, LocationReport> locations})
      : _locations = locations;

  factory _$_AllLocationsReport.fromJson(Map<String, dynamic> json) =>
      _$$_AllLocationsReportFromJson(json);

  @override
  final DateTime timestamp;
  final Map<String, LocationReport> _locations;
  @override
  Map<String, LocationReport> get locations {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_locations);
  }

  @override
  String toString() {
    return 'AllLocationsReport(timestamp: $timestamp, locations: $locations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllLocationsReport &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(_locations));

  @JsonKey(ignore: true)
  @override
  _$$_AllLocationsReportCopyWith<_$_AllLocationsReport> get copyWith =>
      __$$_AllLocationsReportCopyWithImpl<_$_AllLocationsReport>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllLocationsReportToJson(this);
  }
}

abstract class _AllLocationsReport implements AllLocationsReport {
  factory _AllLocationsReport(
          {required final DateTime timestamp,
          required final Map<String, LocationReport> locations}) =
      _$_AllLocationsReport;

  factory _AllLocationsReport.fromJson(Map<String, dynamic> json) =
      _$_AllLocationsReport.fromJson;

  @override
  DateTime get timestamp => throw _privateConstructorUsedError;
  @override
  Map<String, LocationReport> get locations =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AllLocationsReportCopyWith<_$_AllLocationsReport> get copyWith =>
      throw _privateConstructorUsedError;
}
