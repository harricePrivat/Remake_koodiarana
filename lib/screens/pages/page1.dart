import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:koodiarana_cl/providers/bottom_management.dart';
import 'package:koodiarana_cl/screens/components/input.dart';
import 'package:koodiarana_cl/screens/components/services.dart';
import 'package:koodiarana_cl/screens/components/turbo_service.dart';
import 'package:koodiarana_cl/services/get_localisation.dart';
// import 'package:provider/provider.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({super.key});

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  //DECLARATION
  LatLng? _currentPosition;
  TextEditingController searchController = TextEditingController();
  TextEditingController source = TextEditingController();
  List<Widget> listServices = [
    Services(
      title: "Voyager",
      width: 100,
      height: 100,
      sourceImages: "assets/course.png",
    ),
    Services(
      title: "Package",
      width: 100,
      height: 100,
      sourceImages: "assets/package.png",
    ),
    Services(
      title: "Reservation",
      width: 100,
      height: 100,
      sourceImages: "assets/reservation.png",
    ),
  ];
  late FocusNode focusNode = FocusNode();
  late FocusNode focusSearch = FocusNode();
  bool isScroolable = true;

  @override
  void initState() {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isScroolable = false;
        });
      }
    });
    focusSearch.addListener(() {
      if (focusSearch.hasFocus) {
        setState(() {
          isScroolable = true;
        });
      }
    });
    super.initState();
    // getCurrentPostion();r
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
    final theme = Theme.of(context);
    return (_currentPosition == null)
        ? Center(child: CircularProgressIndicator(color: theme.primaryColor))
        : Stack(
          children: [
            ListView(
              physics:
                  isScroolable
                      ? NeverScrollableScrollPhysics()
                      : ScrollPhysics(),
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  curve: Curves.bounceInOut,
                  width: double.infinity,
                  height:
                      isScroolable
                          ? ((8 * MediaQuery.of(context).size.height) / 10)
                          : (70),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 14.4746,
                    ),
                    myLocationEnabled: true,
                    // myLocationButtonEnabled: true,
                    // mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      // You can add any additional setup for the map here
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16.00, right: 16),
                  child: InputKoodiarana(
                    controller: source,
                    focusNode: focusNode,
                    placeholder: Text("Source..."),
                    trailing: Icon(Icons.map),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16.00, right: 16),
                  child: InputKoodiarana(
                    controller: source,
                    // focusNode: focusNode,
                    placeholder: Text("Destination..."),
                    trailing: Icon(Icons.map),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: Text(
                    "Turbo Services",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                TurboService(),
                SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  child: Text(
                    "Autres services",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                // GridView.builder(
                //   scrollDirection: Axis.horizontal,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 3,
                //   ),
                //   itemBuilder: (context, i) {
                //     return listServices[i];
                //   },
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 8,
                  children: [listServices[0], listServices[1], listServices[2]],
                ),
              ],
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 600),
              // bottom: 0,
              // top: 0,
              left: 20,
              top:
                  isScroolable
                      ? 8 * MediaQuery.of(context).size.height / 10 - 28
                      : 8 * MediaQuery.of(context).size.height / 10 - 10,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  if (isScroolable == false) FocusScope.of(context).unfocus();
                  if (isScroolable == true) {
                    FocusScope.of(context).requestFocus(focusNode);
                  }
                  setState(() {
                    isScroolable = !isScroolable;
                  });
                },
                backgroundColor: Colors.white,
                child: Icon(
                  isScroolable
                      ? Icons.arrow_drop_up_sharp
                      : Icons.arrow_drop_down_sharp,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: InputKoodiarana(
                  focusNode: focusSearch,
                  width: 300,
                  leading: Icon(Icons.search),
                  controller: searchController,
                  placeholder: Text("Rechercher un lieux"),
                ),
              ),
            ),
          ],
        );
  }

  @override
  void dispose() {
    super.dispose();
    source.dispose();
    searchController.dispose();
    focusNode.dispose();
  }
}
