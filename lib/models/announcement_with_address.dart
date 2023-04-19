import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';

class AnnouncementWithAddress extends Announcement {
  String address;

  AnnouncementWithAddress({required Announcement announcement, required this.address}) : super(
    id: announcement.id,
    petType: announcement.petType,
    title: announcement.title,
    description: announcement.description,
    imageUrl: announcement.imageUrl,
    geoPosition: announcement.geoPosition
  );
}