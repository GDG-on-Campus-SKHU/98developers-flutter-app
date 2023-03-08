import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explore_markers_state.dart';

class ExploreMarkersCubit extends Cubit<ExploreMarkersState> {
  ExploreMarkersCubit() : super(ExploreMarkersInitial());
}
