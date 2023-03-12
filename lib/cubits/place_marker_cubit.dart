import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'place_marker_state.dart';

class PlaceMarkerCubit extends Cubit<PlaceMarkerState> {
  PlaceMarkerCubit() : super(PlaceMarkerInitial());
}
