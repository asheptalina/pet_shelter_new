// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) {
  return _SignUpRequest.fromJson(json);
}

/// @nodoc
mixin _$SignUpRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpRequestCopyWith<SignUpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestCopyWith<$Res> {
  factory $SignUpRequestCopyWith(
          SignUpRequest value, $Res Function(SignUpRequest) then) =
      _$SignUpRequestCopyWithImpl<$Res, SignUpRequest>;
  @useResult
  $Res call({String email, String password, String userName});
}

/// @nodoc
class _$SignUpRequestCopyWithImpl<$Res, $Val extends SignUpRequest>
    implements $SignUpRequestCopyWith<$Res> {
  _$SignUpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpRequestCopyWith<$Res>
    implements $SignUpRequestCopyWith<$Res> {
  factory _$$_SignUpRequestCopyWith(
          _$_SignUpRequest value, $Res Function(_$_SignUpRequest) then) =
      __$$_SignUpRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String userName});
}

/// @nodoc
class __$$_SignUpRequestCopyWithImpl<$Res>
    extends _$SignUpRequestCopyWithImpl<$Res, _$_SignUpRequest>
    implements _$$_SignUpRequestCopyWith<$Res> {
  __$$_SignUpRequestCopyWithImpl(
      _$_SignUpRequest _value, $Res Function(_$_SignUpRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? userName = null,
  }) {
    return _then(_$_SignUpRequest(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpRequest with DiagnosticableTreeMixin implements _SignUpRequest {
  const _$_SignUpRequest(
      {required this.email, required this.password, required this.userName});

  factory _$_SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpRequestFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String userName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpRequest(email: $email, password: $password, userName: $userName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpRequest'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('userName', userName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpRequestCopyWith<_$_SignUpRequest> get copyWith =>
      __$$_SignUpRequestCopyWithImpl<_$_SignUpRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpRequestToJson(
      this,
    );
  }
}

abstract class _SignUpRequest implements SignUpRequest {
  const factory _SignUpRequest(
      {required final String email,
      required final String password,
      required final String userName}) = _$_SignUpRequest;

  factory _SignUpRequest.fromJson(Map<String, dynamic> json) =
      _$_SignUpRequest.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpRequestCopyWith<_$_SignUpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
