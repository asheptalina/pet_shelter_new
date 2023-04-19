import 'package:flutter/material.dart';
import 'package:pet_shelter_new/states/feed/feed_state.dart';
import 'package:pet_shelter_new/views/feed/feed_widget.dart';
import 'package:provider/provider.dart';

class FeedContainerWidget extends StatelessWidget {
  const FeedContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<FeedState>(context);
    return FeedWidget(state: state);
  }
}
