import 'package:json_annotation/json_annotation.dart';
import 'package:pet_shelter_new/models/dto/geo_position/geo_position.dart';
import 'package:pet_shelter_new/models/pet_type.dart';

part 'announcement.g.dart';

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