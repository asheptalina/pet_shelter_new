import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/announcement_with_address.dart';
import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/models/request_result.dart';
import 'package:pet_shelter_new/services/network_service.dart';

part 'feed_state.g.dart';

class FeedState = FeedStateBase with _$FeedState;

abstract class FeedStateBase with Store {

  @observable PetType? petType;
  @observable List<AnnouncementWithAddress> announcements = [];
  @observable AnnouncementWithAddress? selectedAnnouncement;
  @observable bool inProgress = false;

  final NetworkService networkService;

  FeedStateBase({required this.networkService});

  String? feedError;

  @action
  Future<void> onPetTypeChanged(PetType? petType) {
    this.petType = petType;
    return getAds(petType: petType);
  }

  @action
  void onSelectedAnnouncement(AnnouncementWithAddress? announcement) {
    selectedAnnouncement = announcement;
  }

  @action
  Future<void> onSelectedAnnouncementWithoutAddress(Announcement announcement, VoidCallback onSuccess) async {
    List<Placemark> addresses = await (placemarkFromCoordinates(announcement.geoPosition.lat, announcement.geoPosition.lng));
    final address = addresses.isEmpty ? '' : '${addresses.first.locality}, ${addresses.first.name}';
    selectedAnnouncement = AnnouncementWithAddress(announcement: announcement, address: address);
    onSuccess();
  }

  @action
  Future<void> getAds({PetType? petType}) async {
    feedError = null;
    if (inProgress) {
      return;
    }
    inProgress = true;
    announcements = [];

    final result = await networkService.getAds(petType: petType);

    if (result.status == RequestStatus.success && result.body != null) {
      print(result.body!.length);
      for (var ad in result.body!) {
        try {
          List<Placemark> addresses = await placemarkFromCoordinates(ad.geoPosition.lat, ad.geoPosition.lng);
          final address = addresses.isEmpty ? '' : '${addresses.first.locality}, ${addresses.first.name}';
          announcements.add(AnnouncementWithAddress(announcement: ad, address: address));
        } catch (err) {
          announcements.add(AnnouncementWithAddress(announcement: ad, address: ''));
        }
      }

    } else {
      feedError = AppStrings.defaultErrorMessage;
    }
    inProgress = false;
  }
}
