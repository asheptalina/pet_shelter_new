import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';
import 'package:pet_shelter_new/models/dto/auth_response/auth_response.dart';
import 'package:pet_shelter_new/models/dto/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter_new/models/dto/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter_new/models/dto/user_data/user_data.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/models/request_result.dart';

abstract class NetworkService {
  Future<RequestResult<AuthResponse>> signUp(SignUpRequest request);
  Future<RequestResult<AuthResponse>> signIn(SignInRequest request);

  Future<RequestResult<List<Announcement>>> getAds({PetType? petType});
  Future<RequestResult<Announcement>> getAd(int id);
  Future<RequestResult<List<Announcement>>> createAd(String accessToken, Announcement announcement);

  Future<RequestResult<UserData>> getUserInfo(String accessToken);
  Future<RequestResult<UserData>> updateUserInfo(String accessToken, UserData userData);
}