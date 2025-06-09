// part of 'get_name_position_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// @immutable
// ignore: must_be_immutable
class GetNamePositionEvent extends Equatable {
  LatLng currentPosition;
  bool isMyLocation;
  GetNamePositionEvent({
    required this.isMyLocation,
    required this.currentPosition,
  });
  @override
  List<Object> get props => [currentPosition, isMyLocation];
}
