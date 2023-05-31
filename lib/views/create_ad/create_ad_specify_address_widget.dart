import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:pet_shelter_new/consts/app_assets.dart';
import 'package:pet_shelter_new/consts/app_strings.dart';
import 'package:pet_shelter_new/states/create_ad/create_ad_state.dart';
import 'package:pet_shelter_new/ui_consts/create_ad_ui_consts.dart';
import 'package:pet_shelter_new/ui_consts/main_ui_consts.dart';
import 'package:pet_shelter_new/views/components/custom_app_bar.dart';
import 'package:pet_shelter_new/views/components/primary_button.dart';

class CreateAdSpecifyAddressWidget extends StatefulWidget {
  final CreateAdState state;

  const CreateAdSpecifyAddressWidget({required this.state, Key? key}) : super(key: key);

  @override
  State<CreateAdSpecifyAddressWidget> createState() => _CreateAdSpecifyAddressWidgetState();
}

class _CreateAdSpecifyAddressWidgetState extends State<CreateAdSpecifyAddressWidget> {
  final _mapController = MapController();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  LatLng? _markerPosition;

  @override
  void initState() {
    super.initState();
    _markerPosition = widget.state.coordinate;
    _updateCurrentLocation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_markerPosition != null) {
        _mapController.moveAndRotate(_markerPosition!, CreateAdUIConstants.mapDefaultZoom, 0);
      } else if (_locationData?.latitude != null && _locationData?.longitude != null ) {
        _mapController.moveAndRotate(
            LatLng(_locationData!.latitude!, _locationData!.longitude!),
            CreateAdUIConstants.mapDefaultZoom,
            0
        );
      }
    });
  }

  Future<void> _updateCurrentLocation() async {
    final location = Location();
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    if (_locationData?.latitude != null && _locationData?.longitude != null ) {
      final lat = _locationData!.latitude!;
      final lng = _locationData!.longitude!;
      setState(() {
        _markerPosition = LatLng(lat, lng);
      });
      _mapController.moveAndRotate(_markerPosition!, 13.0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
            header: AppStrings.specifyAddressHeader,
            onBack: () => widget.state.selectScreen(CreateAdScreen.reviewPhoto)
        ),
        Expanded(child: _buildContent(context))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: [
        _buildMap(),
        Padding(
          padding: const EdgeInsets.only(bottom: MainUIConstants.verticalPadding),
          child: Column(
            children: [
              Padding(
                padding: CreateAdUIConstants.currentLocationButtonPaddings,
                child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () => _updateCurrentLocation(),
                        child: SvgPicture.asset(AppAssets.currentLocationButton)
                    )
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                    label: AppStrings.confirmButton,
                    icon: AppAssets.checkMarkIcon,
                    onPressed: _markerPosition == null ? null : () {
                      widget.state.saveCoordinate(_markerPosition!);
                      widget.state.selectScreen(CreateAdScreen.addDescription);
                    }
                )
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMap() {
    List<Marker> markers = [];
    if (_markerPosition != null) {
      markers.add(Marker(
        point: _markerPosition!,
        builder: (_) => SvgPicture.asset(AppAssets.locationMarker),
        width: CreateAdUIConstants.mapMarkerSize,
        height: CreateAdUIConstants.mapMarkerSize,
        anchorPos: AnchorPos.align(AnchorAlign.top),
        rotate: true
      ));
    }
    return FlutterMap(
      options: MapOptions(
        zoom: CreateAdUIConstants.mapDefaultZoom,
        onTap: (_, latLng) {
          setState(() {
            _markerPosition = latLng;
          });
        }
      ),
      mapController: _mapController,
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        MarkerLayer(markers: markers)
      ],
    );
  }
}
