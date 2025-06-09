import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:koodiarana_cl/bloc/get_name_position/get_name_position_bloc.dart';
import 'package:koodiarana_cl/bloc/get_name_position/get_name_position_event.dart';
import 'package:koodiarana_cl/providers/scroll1_management.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GoogleMapsKoodiarana extends StatefulWidget {
  LatLng currentPosition;
  TextEditingController controller;
  FocusNode focusNode;
  bool scroll;
  GlobalKey globalKey;
  GoogleMapsKoodiarana({
    required this.scroll,
    required this.globalKey,
    required this.controller,
    required this.focusNode,
    required this.currentPosition,
    super.key,
  });

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
              : BlocListener<GetNamePositionBloc, GetNamePositionState>(
                listener: (context, state) {
                  if (state is GetNamePositionError) {
                    Fluttertoast.showToast(msg: state.message);
                  } else if (state is GetNamePositionDone) {
                    if (!state.isMyLocation) {
                      setState(() {
                        widget.controller.text = state.city;
                      });
                      Provider.of<Scroll1Management>(
                        context,
                        listen: false,
                      ).setScrollable(false);
                      Scrollable.ensureVisible(
                        widget.globalKey.currentContext!,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        alignment: 0.125,
                      ).then((_) {
                        FocusScope.of(context).requestFocus(widget.focusNode);
                      });
                    }
                  }
                },
                child: GoogleMap(
                  onTap: (latLng) {
                    context.read<GetNamePositionBloc>().add(
                      GetNamePositionEvent(
                        currentPosition: latLng,
                        isMyLocation: false,
                      ),
                    );
                  },
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
              ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _mapController!.dispose();
  }
}
