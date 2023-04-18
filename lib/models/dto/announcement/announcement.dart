import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_shelter_new/models/dto/geo_position/geo_position.dart';
import 'package:pet_shelter_new/models/pet_type.dart';

// part 'announcement.freezed.dart';
part 'announcement.g.dart';

// @freezed
// class Announcement with _$Announcement {
//   const factory Announcement({
//     int? id,
//     required PetType petType,
//     required String imageUrl,
//     required String title,
//     required String description,
//     required GeoPosition geoPosition
//   }) = _Announcement;
//
//   factory Announcement.fromJson(Map<String, Object?> json) =>
//       _$AnnouncementFromJson(json);
// }
//
// class Announcement with _$Announcement {
//   const factory Announcement({
//     int? id,
//     required PetType petType,
//     required String imageUrl,
//     required String title,
//     required String description,
//     required GeoPosition geoPosition
//   }) = _Announcement;
//
//   factory Announcement.fromJson(Map<String, Object?> json) =>
//       _$AnnouncementFromJson(json);
// }

@JsonSerializable()
class Announcement {
  int? id;
  PetType petType;
  String imageUrl;
  String title;
  String description;
  GeoPosition geoPosition;

  Announcement({this.id,
    required this.petType,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.geoPosition});

  factory Announcement.fromJson(Map<String, dynamic> json) => _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);
}