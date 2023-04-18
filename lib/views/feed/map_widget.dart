import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/states/feed/feed_state.dart';
import 'package:pet_shelter_new/ui_consts/create_ad_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class AdInfoMapWidget extends StatelessWidget {
  const AdInfoMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ad = Provider.of<FeedState>(context).selectedAnnouncement!;
    List<Marker> markers = [
      Marker(
          point: LatLng(ad.geoPosition.lat, ad.geoPosition.lng),
          builder: (_) => SvgPicture.asset(AppAssets.locationMarker),
          width: CreateAdUIConstants.mapMarkerSize,
          height: CreateAdUIConstants.mapMarkerSize,
          anchorPos: AnchorPos.align(AnchorAlign.top)
      )
    ];
    return Column(
      children: [
        CustomAppBar(header: ad.title, onBack: () => Routemaster.of(context).history.back()),
        Expanded(
          child: FlutterMap(
            options: MapOptions(
              zoom: CreateAdUIConstants.mapDefaultZoom,
              center: LatLng(ad.geoPosition.lat, ad.geoPosition.lng),
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(markers: markers)
            ],
          )
        )
      ],
    );
  }
}
