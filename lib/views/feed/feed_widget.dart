import 'package:flutter/material.dart';
import 'package:pet_shelter_new/states/feed/feed_state.dart';
import 'package:pet_shelter_new/views/components/loading_widget.dart';
import 'package:pet_shelter_new/views/feed/feed_item_widget.dart';

// class FeedWidget extends StatelessWidget {
//   const FeedWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final state = FeedState(networkService: GetIt.instance.get<NetworkService>());
//     return GridView.count(
//         crossAxisCount: crossAxisCount
//     );
//   }
// }
class FeedWidget extends StatefulWidget {

  final FeedState state;

  const FeedWidget({required this.state, Key? key})
      : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {

  Future<void>? _future;

  @override
  void initState() {
    _future = widget.state.getAds();
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    _future = widget.state.getAds();
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingWidget(context);
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return _buildErrorWidget("Error during loading books");
              } else {
                return _buildContent();
              }
            case ConnectionState.waiting:
              return const LoadingWidget();
            default:
              return _buildErrorWidget("Wrong state!");
          }
        })
    );
  }

  Widget _buildErrorWidget(String parameters) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(parameters)
              ]
          )
        ]
    );
  }

  Widget _buildContent() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.6,
      children: widget.state.announcements.map((ad) => FeedItemWidget(
          imageUrl: ad.imageUrl,
          title: ad.title,
          description: ad.description,
          address: "dedewdew 45"
      )).toList(growable: false),
    );
  }
}
