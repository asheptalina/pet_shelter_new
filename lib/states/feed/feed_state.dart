import 'package:mobx/mobx.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/models/dto/announcement/announcement.dart';
import 'package:pet_shelter_new/models/pet_type.dart';
import 'package:pet_shelter_new/services/network_service.dart';

part 'feed_state.g.dart';

class FeedState = FeedStateBase with _$FeedState;

abstract class FeedStateBase with Store {

  @observable PetType? petType;
  @observable List<Announcement> announcements = [];

  final NetworkService networkService;

  FeedStateBase({required this.networkService}) {
    // getAds();
  }

  String? feedError;

  @action
  Future<void> onPetTypeChanged(PetType? petType) {
    this.petType = petType;
    return getAds(petType: petType);
  }

  @action
  Future<void> getAds({PetType? petType}) async {
    feedError = null;
    announcements = [];

    var result = await networkService.getAds(petType: petType);

    if (result.success && result.body != null) {
      announcements = result.body!;
    } else {
      feedError = AppStrings.defaultErrorMessage;
    }
  }
}
