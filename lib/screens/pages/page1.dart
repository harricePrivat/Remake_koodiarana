import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:koodiarana_cl/providers/scroll1_management.dart';
// import 'package:koodiarana_cl/providers/bottom_management.dart';
import 'package:koodiarana_cl/screens/components/input.dart';
import 'package:koodiarana_cl/screens/components/list_taches.dart';
import 'package:koodiarana_cl/screens/components/services.dart';
import 'package:koodiarana_cl/screens/components/turbo_service.dart';
import 'package:provider/provider.dart';
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
  ScrollController scrollControl = ScrollController();
  TextEditingController source = TextEditingController();
  final GlobalKey _globalKey = GlobalKey();
  List<Widget> listServices = [
    Services(
      title: "Voyager",
      width: 100,
      height: 120,
      sourceImages: "assets/course.png",
    ),
    Services(
      title: "Package",
      width: 100,
      height: 120,
      sourceImages: "assets/package.png",
    ),
    Services(
      title: "Reservation",
      width: 100,
      height: 120,
      sourceImages: "assets/reservation.png",
    ),
  ];
  late FocusNode focusNode = FocusNode();
  late FocusNode focusSearch = FocusNode();

  @override
  void initState() {
    super.initState();

    getCurrentLocalisation();
    scrollControl.addListener(() {
      // searchController.
      if (scrollControl.position.pixels < 100 &&
          scrollControl.position.userScrollDirection ==
              ScrollDirection.forward) {
        Provider.of<Scroll1Management>(
          context,
          listen: false,
        ).setScrollable(true);
      }
    });

    focusSearch.addListener(() {
      if (focusSearch.hasFocus) {
        scrollTop(0);
        Provider.of<Scroll1Management>(
          context,
          listen: false,
        ).setScrollable(true);
      }
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
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> scrollTop(double destination) async {
    scrollControl.animateTo(
      destination,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return (_currentPosition == null)
        ? Center(child: CircularProgressIndicator(color: theme.primaryColor))
        : Consumer<Scroll1Management>(
          builder: (context, isScrollable, child) {
            return Stack(
              children: [
                ListView(
                  controller: scrollControl,
                  physics:
                      isScrollable.isScrolable
                          ? NeverScrollableScrollPhysics()
                          : ClampingScrollPhysics(),
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.bounceInOut,
                      width: double.infinity,
                      height: ((10 * MediaQuery.of(context).size.height) / 10),
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
                      padding: EdgeInsets.only(left: 32.00, right: 32),
                      child: InputKoodiarana(
                        key: _globalKey,
                        controller: source,
                        focusNode: focusNode,
                        placeholder: Text("Source..."),
                        trailing: Icon(Icons.map),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(left: 32.00, right: 32),
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
                    TurboService(
                      color: Color(0xFF161CCC),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/moto.png"),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ), // Arrondi personnalisé
                            ),
                            onPressed: () {},
                            mini: true,
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 16),
                      child: Text(
                        "Autres services",
                        textAlign: TextAlign.start,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 8,
                        children: [
                          listServices[0],
                          listServices[1],
                          listServices[2],
                        ],
                      ),
                    ),
                    TurboService(
                      gradient: RadialGradient(
                        center: const Alignment(-1.0, 0.0), // centré à gauche
                        radius: 1.2,
                        colors: [
                          Color(0xFFC7DB76), // très clair
                          Color(0xFFB0C347), // clair
                          Color(0xFF889810), // couleur originale
                          Color(0xFF5F6C0C), //
                        ],
                        stops: [0.0, 0.4, 0.7, 1.0],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/money.png"),
                              Text(
                                "Manage payement",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ), // Arrondi personnalisé
                            ),
                            onPressed: () {},
                            mini: true,
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    MyPreviousCoursesWidget(
                      title: 'My previous courses',
                      backgroundColor: Color(0xFFE5E5E5),
                    ),
                    MyPreviousCoursesWidget(
                      title: 'Notifications',
                      backgroundColor: Color(0xFFFF2121).withValues(alpha: 0.6),
                    ),
                  ],
                ),

                Positioned(
                  // bottom: 0,
                  // top: 0,
                  left: 20,
                  top: 8 * MediaQuery.of(context).size.height / 10 - 28,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {
                      if (isScrollable.isScrolable == false) {
                        scrollTop(0).then((_) {
                          FocusScope.of(context).unfocus();
                        });
                      } else if (isScrollable.isScrolable == true) {
                        Scrollable.ensureVisible(
                          _globalKey.currentContext!,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                          alignment: 0.125,
                        ).then((_) {
                          FocusScope.of(context).requestFocus(focusNode);
                        });
                      }
                      // setState(() {
                      //   isS = !isScroolable;
                      // });
                      isScrollable.setScrollable(
                        !isScrollable.isScrolable,
                      );
                    },
                    backgroundColor: Colors.white,
                    child:
                        isScrollable.isScrolable
                            ? Icon(Icons.map, color: Colors.red, size: 30)
                            : Icon(Icons.map, color: Colors.green),
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
          },
        );
  }

  @override
  void dispose() {
    super.dispose();
    source.dispose();
    scrollControl.dispose();
    searchController.dispose();
    focusNode.dispose();
  }
}
