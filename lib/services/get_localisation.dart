import 'package:geolocator/geolocator.dart';
class GetLocalisation {
  /// This method determines the current position of the device.
  /// It checks if the location services are enabled and if the app has the necessary permissions.
  /// If the permissions are denied, it requests them from the user.
  /// If the permissions are granted, it returns the current position.

  Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
  }

    //   bool serviceEnabled;
  //   LocationPermission locationPermission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     Future.error('Vous avez besoin de la permission');
  //   }
  //   locationPermission = await Geolocator.checkPermission();
  //   if (locationPermission == LocationPermission.denied) {
  //     locationPermission = await Geolocator.requestPermission();
  //     if (locationPermission == LocationPermission.denied) {
  //       return Future.error('La permission a ete refuse');
  //     }
  //   }
  //   if (locationPermission == LocationPermission.deniedForever) {
  //     return Future.error('La permission a ete refuse de maniere permanente');
  //   }

  //   Position position = await Geolocator.getCurrentPosition();
  //   print("voici current Postion $position");
  //   setState(() {
  //     _currentPosition = LatLng(position.latitude, position.longitude);
  //   });
}