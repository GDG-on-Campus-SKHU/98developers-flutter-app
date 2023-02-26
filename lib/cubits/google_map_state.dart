part of 'google_map_cubit.dart';

abstract class GoogleMapState extends Equatable {
  GoogleMapState();

  @override
  List<Object> get props => [];
}

class GoogleMapInitial extends GoogleMapState {}

class GoogleMapLoaded extends GoogleMapState {
  final GoogleMapController googleMapController;

  GoogleMapLoaded(this.googleMapController);

  @override
  List<Object> get props => [googleMapController];
}

class GoogleMapError extends GoogleMapState {
  final String errorMessage;

  GoogleMapError(this.errorMessage);

  @override
  List<Object> get props => [];
}
