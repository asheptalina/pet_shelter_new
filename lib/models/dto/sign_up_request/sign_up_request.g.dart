// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpRequest _$$_SignUpRequestFromJson(Map<String, dynamic> json) =>
    _$_SignUpRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$_SignUpRequestToJson(_$_SignUpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
    };
