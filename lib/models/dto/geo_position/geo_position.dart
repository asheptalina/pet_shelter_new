import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_position.freezed.dart';
part 'geo_position.g.dart';

@freezed
class GeoPosition with _$GeoPosition {
  const factory GeoPosition({
    required double lat,
    required double lng
  }) = _GeoPosition;

  factory GeoPosition.fromJson(Map<String, Object?> json) =>
      _$GeoPositionFromJson(json);
}