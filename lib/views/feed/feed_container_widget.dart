import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_shelter_new/services/network_service.dart';
import 'package:pet_shelter_new/states/feed/feed_state.dart';
import 'package:pet_shelter_new/views/feed/feed_widget.dart';

class FeedContainerWidget extends StatelessWidget {
  const FeedContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = FeedState(networkService: GetIt.instance.get<NetworkService>());
    return FeedWidget(state: state);
  }
}
