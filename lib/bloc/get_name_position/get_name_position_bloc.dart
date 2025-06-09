import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:koodiarana_cl/bloc/get_name_position/get_name_position_event.dart';
import 'package:koodiarana_cl/services/send_data.dart';
part 'get_name_position_state.dart';

class GetNamePositionBloc
    extends Bloc<GetNamePositionEvent, GetNamePositionState> {
  GetNamePositionBloc() : super(GetNamePositionInitial()) {
    on<GetNamePositionEvent>((event, emit) async {
      emit(GetNamePositionLoading());
      try {
        final response = await SendData().goGet(
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=${event.currentPosition.latitude}, ${event.currentPosition.longitude}&key=${dotenv.env['API_GOOGLE_MAPS']}",
        );
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          emit(
            GetNamePositionDone(
              city: body['results'][0]['formatted_address'],
              isMyLocation: event.isMyLocation,
            ),
          );
        } else {
          emit(GetNamePositionError(message: "Lieux introuvables"));
          print("Voici la status code de la reponse ${response}");
        }
      } catch (e) {
        emit(
          GetNamePositionError(
            message: "Veuillez vérifier votre connexion internet",
          ),
        );
        print("voici l'erreur:$e");
      }
    });
  }
}
