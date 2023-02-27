part of 'google_map_cubit.dart';

abstract class GoogleMapState extends Equatable {
  const GoogleMapState();

  @override
  List<Object> get props => [];
}

//Loading State
class GoogleMapLoading extends GoogleMapState {}

//Loaded State
class GoogleMapLoaded extends GoogleMapState {
  //성공적으로 Google Map이 로드되었을 경우 두가지를 props 객체로 전달
  final LatLng initialCameraPosition;
  final Set<Marker> markers;

  GoogleMapLoaded({
    required this.initialCameraPosition,
    required this.markers,
    // required this.markers,
  });

  @override
  List<Object> get props => [initialCameraPosition];
}

class GoogleMapCameraMove extends GoogleMapState {
  final CameraPosition cameraPosition;

  GoogleMapCameraMove({
    required this.cameraPosition,
  });
}

//Load failed State
class GoogleMapError extends GoogleMapState {
  final String errorMessage;

  GoogleMapError(this.errorMessage);

  @override
  List<Object> get props => [];
}
