// import 'package:latlong2/latlong.dart';
// import 'package:mobx/mobx.dart';
// import 'package:pet_shelter_new/consts/app_strings.dart';
// import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';
// import 'package:pet_shelter_new/models/dto/geo_position/geo_position.dart';
// import 'package:pet_shelter_new/models/pet_type.dart';
// import 'package:pet_shelter_new/services/network_service.dart';
//
// // part 'ad_info_state.g.dart';
//
// // class AdInfoState = AdInfoStateBase with _$AdInfoState;
//
// class AdInfoState with Store {
//
//   final String adId;
//   final NetworkService networkService;
//   String title = "";
//   String description = "";
//   String imageUrl = "";
//   String address = "";
//   GeoPosition geoPosition = GeoPosition(lat: 55, lng: 73);
//
//   AdInfoState({required this.adId, required this.networkService});
//
//   String? fetchError;
//
//   Future<void> getAd() async {
//     fetchError = null;
//
//     var result = await networkService.getAd(adId);
//
//     if (result.success && result.body != null) {
//       final ad = result.body!;
//       title = ad.title;
//       imageUrl = ad.imageUrl;
//       description = ad.description;
//       geoPosition = ad.geoPosition;
//       address = "Address example";
//     } else {
//       fetchError = AppStrings.defaultErrorMessage;
//     }
//   }
// }
