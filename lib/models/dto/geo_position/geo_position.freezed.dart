// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
}

/// @nodoc
mixin _$GeoPosition {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoPositionCopyWith<GeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPositionCopyWith<$Res> {
  factory $GeoPositionCopyWith(
          GeoPosition value, $Res Function(GeoPosition) then) =
      _$GeoPositionCopyWithImpl<$Res, GeoPosition>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$GeoPositionCopyWithImpl<$Res, $Val extends GeoPosition>
    implements $GeoPositionCopyWith<$Res> {
  _$GeoPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeoPositionCopyWith<$Res>
    implements $GeoPositionCopyWith<$Res> {
  factory _$$_GeoPositionCopyWith(
          _$_GeoPosition value, $Res Function(_$_GeoPosition) then) =
      __$$_GeoPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_GeoPositionCopyWithImpl<$Res>
    extends _$GeoPositionCopyWithImpl<$Res, _$_GeoPosition>
    implements _$$_GeoPositionCopyWith<$Res> {
  __$$_GeoPositionCopyWithImpl(
      _$_GeoPosition _value, $Res Function(_$_GeoPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_GeoPosition(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoPosition with DiagnosticableTreeMixin implements _GeoPosition {
  const _$_GeoPosition({required this.lat, required this.lng});

  factory _$_GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$$_GeoPositionFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeoPosition(lat: $lat, lng: $lng)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeoPosition'))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('lng', lng));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeoPosition &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeoPositionCopyWith<_$_GeoPosition> get copyWith =>
      __$$_GeoPositionCopyWithImpl<_$_GeoPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoPositionToJson(
      this,
    );
  }
}

abstract class _GeoPosition implements GeoPosition {
  const factory _GeoPosition(
      {required final double lat, required final double lng}) = _$_GeoPosition;

  factory _GeoPosition.fromJson(Map<String, dynamic> json) =
      _$_GeoPosition.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_GeoPositionCopyWith<_$_GeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
