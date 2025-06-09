part of 'get_name_position_bloc.dart';

sealed class GetNamePositionState {}

final class GetNamePositionInitial extends GetNamePositionState {}

final class GetNamePositionError extends GetNamePositionState {
  String message;
  GetNamePositionError({required this.message});
}

final class GetNamePositionDone extends GetNamePositionState {
  String city;
  bool isMyLocation;
  GetNamePositionDone({required this.city, required this.isMyLocation});
}

final class GetNamePositionLoading extends GetNamePositionState {}
