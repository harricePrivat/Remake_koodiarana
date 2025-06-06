import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

// ignore: must_be_immutable
class GoogleMapsKoodiarana extends StatefulWidget {
  LatLng currentPosition;
  GoogleMapsKoodiarana({required this.currentPosition, super.key});

  @override
  State<GoogleMapsKoodiarana> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMapsKoodiarana> {
  String? _mapStyle;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
    setState(() {});
    // print(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ((9.5 * MediaQuery.of(context).size.height) / 10),
      child:
          _mapStyle == null
              ? CircularProgressIndicator()
              : GoogleMap(
                style: _mapStyle,
                // scrollGesturesEnabled: false,
                // liteModeEnabled: false,
                // tiltGesturesEnabled: true,
                liteModeEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: widget.currentPosition,
                  zoom: 14.4746,
                ),
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _mapController = controller;
                },
              ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mapController!.dispose();
  }
}
