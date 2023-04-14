import 'package:pet_shelter_new/models/auth_response/auth_response.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/models/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter_new/models/sign_up_request/sign_up_request.dart';

abstract class NetworkService {
  Future<RequestResult<AuthResponse>> signUp(SignUpRequest request);
  Future<RequestResult<AuthResponse>> signIn(SignInRequest request);

  // Future<RequestResult<List<Announcement>>> getAds({PetType? petType});
  // Future<RequestResult<List<Announcement>>> createAd(String accessToken, Announcement announcement);
}