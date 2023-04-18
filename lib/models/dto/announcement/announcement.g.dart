// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Announcement _$AnnouncementFromJson(Map<String, dynamic> json) => Announcement(
      id: json['id'] as int?,
      petType: $enumDecode(_$PetTypeEnumMap, json['petType']),
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      geoPosition:
          GeoPosition.fromJson(json['geoPosition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnouncementToJson(Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'petType': _$PetTypeEnumMap[instance.petType]!,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'description': instance.description,
      'geoPosition': instance.geoPosition,
    };

const _$PetTypeEnumMap = {
  PetType.cat: 'cat',
  PetType.dog: 'dog',
  PetType.other: 'other',
};
