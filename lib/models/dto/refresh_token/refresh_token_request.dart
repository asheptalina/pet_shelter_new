import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_request.freezed.dart';
part 'refresh_token_request.g.dart';

@freezed
class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({
    required String refreshToken
  }) = _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(Map<String, Object?> json) =>
      _$RefreshTokenRequestFromJson(json);
}