import 'package:dio/dio.dart';
import 'package:pet_shelter_new/models/dto/auth_response/auth_response.dart';
import 'package:pet_shelter_new/models/dto/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter_new/models/dto/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/services/network_service.dart';

class DioNetworkService extends NetworkService {

  final Dio _dio;

  DioNetworkService() : _dio = Dio() {
    _dio.options.baseUrl = 'https://pet-shelter-api.issart.com/api/1.0.0';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  @override
  Future<RequestResult<AuthResponse>> signIn(SignInRequest request) {
    return _post(
        path: '/login/email',
        data: request,
        parser: (json) => AuthResponse.fromJson(json)
    );
  }

  @override
  Future<RequestResult<AuthResponse>> signUp(SignUpRequest request) {
    return _post(
        path: '/register/email',
        data: request,
        parser: (json) => AuthResponse.fromJson(json)
    );

  }

  Future<RequestResult<T>> _post<T, V>({
    required String path,
    String? accessToken,
    required V data,
    required T Function(Map<String, Object?> json) parser
  }) async {
    try {
      final response = await _dio.post(
          '${_dio.options.baseUrl}$path',
          data: data,
          options: Options(
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: accessToken == null ? {} : {'Authorization': 'Bearer $accessToken'}
          )
      );
      print(response);
      if (response.statusCode == 200) {
        print("Success");
        return RequestResult(
            success: true,
            body: parser(response.data)
        );
      } else {
        // ErrorResponse.fromJson(jsonDecode(response.body)).message;
        print('Request error. Url: $path,\nError: ${response.data}');
        return RequestResult(
            success: false,
            errorMessage: response.data
        );
      }
    } catch (error) {
      print('Request error. Url: $path,\nError: $error');
      return RequestResult(
          success: false,
          errorMessage: 'Failed request $path. Error: $error'
      );
    }
  }

  Future<RequestResult<T>> _get<T>({
    required String path,
    String? accessToken,
    required Map<String, String> queryParams,
    required T Function(String responseBody) parser
  }) async {
    try {
      final response = await _dio.get(
          path,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
              headers: accessToken == null ? {} : {'Authorization': 'Bearer $accessToken'}
          )
      );
      if (response.statusCode == 200) {
        return RequestResult(
            success: true,
            body: parser(response.data)
        );
      } else {
        // ErrorResponse.fromJson(jsonDecode(response.body)).message;
        print('Request error. Url: ${path.toString()},\nError: ${response.data}');
        return RequestResult(
            success: false,
            errorMessage: response.data
        );
      }
    } catch (error) {
      print('Request error. Url: ${path.toString()},\nError: $error');
      return RequestResult(
          success: false,
          errorMessage: 'Failed request ${path.toString()}. Error: $error'
      );
    }
  }
}