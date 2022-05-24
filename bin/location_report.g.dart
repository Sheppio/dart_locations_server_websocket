// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationReport _$$_LocationReportFromJson(Map<String, dynamic> json) =>
    _$_LocationReport(
      timestamp: DateTime.parse(json['timestamp'] as String),
      id: json['id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      elevation: (json['elevation'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_LocationReportToJson(_$_LocationReport instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'accuracy': instance.accuracy,
      'heading': instance.heading,
      'speed': instance.speed,
    };

_$_AllLocationsReport _$$_AllLocationsReportFromJson(
        Map<String, dynamic> json) =>
    _$_AllLocationsReport(
      timestamp: DateTime.parse(json['timestamp'] as String),
      locations: (json['locations'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, LocationReport.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_AllLocationsReportToJson(
        _$_AllLocationsReport instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'locations': instance.locations.map((k, e) => MapEntry(k, e.toJson())),
    };
