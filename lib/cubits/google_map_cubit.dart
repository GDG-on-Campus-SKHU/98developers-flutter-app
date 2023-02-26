import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapInitial());

  GoogleMapController? _googleMapController;

  void onMapCreated(GoogleMapController googleMapController) {
    _googleMapController = googleMapController;
    emit(GoogleMapLoaded(_googleMapController!));
  }

  void onCameraMove(CameraPosition cameraPosition) {
    emit(GoogleMapLoaded(_googleMapController!));
  }
  /*
  static const EXPLORE_URL = "http://zikiza.duckdns.org/explore";
  double _latitude;
  double _longitude;
  Set<Marker> _markers = {};

  Future<void> getLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude = position.latitude;
      _longitude = position.longitude;
      emit(GoogleMapLoaded(
          latitude: _latitude, longitude: _longitude, markers: _markers));
    } catch (e) {
      emit(GoogleMapError());
    }
  }

  void addMarker(LatLng position, String name, String tag, String address) {
    _markers.add(
      Marker(
          markerId: MarkerId(name),
          position: position,
          infoWindow: InfoWindow(
            title: name,
          )),
    );
    emit(GoogleMapLoaded(
        latitude: _latitude, longitude: _longitude, markers: _markers));
  }
  */
}
