import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koodiarana_cl/services/get_localisation.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    // getCurrentPostion();
    getCurrentLocalisation();
  }

  Future<void> getCurrentPostion() async {
    Position position = await GetLocalisation().determinePosition();
    print("Voici current Postion $_currentPosition");
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> getCurrentLocalisation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Future.error('Vous avez besoin de la permission');
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('La permission a ete refuse');
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('La permission a ete refuse de maniere permanente');
    }

    Position position = await Geolocator.getCurrentPosition();
    print("voici current Postion $position");
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).primaryColor;
    return Stack(
      children: [
        (_currentPosition == null)
            ? Center(child: CircularProgressIndicator(color: colorTheme))
            : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  _currentPosition!.latitude,
                  _currentPosition!.longitude,
                ),
                zoom: 14.4746,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                // You can add any additional setup for the map here
              },
            ),
      ],
    );
  }
}
