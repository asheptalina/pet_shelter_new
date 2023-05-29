import 'package:dio/dio.dart';
import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';
import 'package:pet_shelter_new/models/dto/auth_response/auth_response.dart';
import 'package:pet_shelter_new/models/dto/refresh_token/refresh_token_request.dart';
import 'package:pet_shelter_new/models/dto/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter_new/models/dto/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter_new/models/dto/user_data/user_data.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/repositories/local_storage/local_storage.dart';
import 'package:pet_shelter_new/services/network_service.dart';

class DioNetworkService extends NetworkService {

  final Dio _dio;
  final LocalStorage localStorage;

  DioNetworkService({required this.localStorage}) : _dio = Dio() {
    _dio.options.baseUrl = 'https://pet-shelter-api.issart.com/api/1.0.0';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  @override
  Future<RequestResult<AuthResponse>> signIn(SignInRequest request) {
    return _post(
        path: '/login/email',
        data: request,
        parser: (response) => AuthResponse.fromJson(response.data)
    );
  }

  @override
  Future<RequestResult<AuthResponse>> signUp(SignUpRequest request) {
    return _post(
        path: '/register/email',
        data: request,
        parser: (response) => AuthResponse.fromJson(response.data)
    );
  }

  @override
  Future<RequestResult<List<Announcement>>> getAds({PetType? petType}) {
    return _get<List<Announcement>>(
        path: '/announcements',
        queryParams: petType == null ? {} : {'petType': petType.name},
        parser: (response) => (response.data as List)
            .map((json) => Announcement.fromJson(json))
            .toList()
    );
  }

  @override
  Future<RequestResult<Announcement>> getAd(int id) {
    return _get<Announcement>(
        path: '/announcement',
        queryParams: {'id': id.toString()},
        parser: (response) => Announcement.fromJson(response.data)
    );
  }

  @override
  Future<RequestResult<List<Announcement>>> createAd(String accessToken, Announcement announcement) {
    return _post(
        path: "/announcements",
        data: announcement,
        parser: (response) => (response.data as List)
            .map((json) => Announcement.fromJson(json))
            .toList()
    );
  }

  @override
  Future<RequestResult<UserData>> getUserInfo(String accessToken) {
    return _get<UserData>(
        path: '/user/profile',
        accessToken: accessToken,
        queryParams: {},
        parser: (response) => UserData.fromJson(response.data)
    );
  }

  @override
  Future<RequestResult<UserData>> updateUserInfo(String accessToken, UserData userData) {
    return _post(
        path: '/user/profile',
        accessToken: accessToken,
        data: userData,
        parser: (response) => UserData.fromJson(response.data)
    );
  }

  Future<bool> refreshTokens() async {
    if (localStorage.getRefreshToken() != null) {
      final response = await _post(
          path: '/token/refresh',
          data: RefreshTokenRequest(refreshToken: localStorage.getRefreshToken()!),
          parser: (response) => AuthResponse.fromJson(response.data)
      );
      if (response.status == RequestStatus.success && response.body != null) {
        localStorage.saveAccessToken(response.body!.accessToken);
        localStorage.saveRefreshToken(response.body!.refreshToken);
        return true;
      }
    }
    return false;
  }

  Future<RequestResult<T>> _post<T, V>({
    required String path,
    String? accessToken,
    required V data,
    required T Function(Response response) parser
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
            status: RequestStatus.success,
            body: parser(response)
        );
      } else {
        // ErrorResponse.fromJson(jsonDecode(response.body)).message;
        print('Request error. Url: $path,\nError: ${response.data}');
        return RequestResult(
            status: RequestStatus.failure,
            errorMessage: response.data
        );
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == 401) {
        final refreshedTokens = await refreshTokens();
        if (refreshedTokens) {
          return _post(path: path, accessToken: localStorage.getAccessToken(), data: data, parser: parser);
        } else {
          return RequestResult(
              status: RequestStatus.tokenExpired,
              errorMessage: 'Refresh token is expired'
          );
        }
      }
      print('Request error. Url: $path,\nError: $error');
      return RequestResult(
          status: RequestStatus.failure,
          errorMessage: 'Failed request $path. Error: $error'
      );
    }
  }

  Future<RequestResult<T>> _get<T>({
    required String path,
    String? accessToken,
    required Map<String, String> queryParams,
    required T Function(Response response) parser
  }) async {
    try {
      final response = await _dio.get(
          path,
          queryParameters: queryParams,
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
              headers: accessToken == null ? {} : {'Authorization': 'Bearer $accessToken'}
          )
      );
      if (response.statusCode == 200) {
        return RequestResult(
            status: RequestStatus.success,
            body: parser(response)
        );
      } else {
        // ErrorResponse.fromJson(jsonDecode(response.body)).message;
        print('Request error. Url: ${path.toString()},\nError: ${response.data}');
        return RequestResult(
            status: RequestStatus.failure,
            errorMessage: response.data
        );
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == 401) {
        final refreshedTokens = await refreshTokens();
        if (refreshedTokens) {
          return _get(path: path, accessToken: localStorage.getAccessToken(), queryParams: queryParams, parser: parser);
        } else {
          return RequestResult(
              status: RequestStatus.tokenExpired,
              errorMessage: 'Refresh token is expired'
          );
        }
      }
      print('Request error. Url: ${path.toString()},\nError: $error');
      return RequestResult(
          status: RequestStatus.failure,
          errorMessage: 'Failed request ${path.toString()}. Error: $error'
      );
    }
  }

}

extension NullableObjectsExtensions<T> on T {
  bool isSubtypeOf<S>() => <T>[] is List<S>;
  bool isSupertypeOf<S>() => <S>[] is List<T>;
}