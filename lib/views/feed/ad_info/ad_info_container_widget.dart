import 'package:flutter/material.dart';
import 'package:pet_shelter_new/states/feed/feed_state.dart';
import 'package:pet_shelter_new/views/feed/ad_info/ad_info_widget.dart';
import 'package:provider/provider.dart';

class AdInfoContainerWidget extends StatelessWidget {
  const AdInfoContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FeedState>(context);
    return AdInfoWidget(ad: state.selectedAnnouncement!);
  }
}
