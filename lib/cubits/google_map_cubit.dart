import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapLoading()) {
    _getCurrentLocation();
  }

  final Completer<GoogleMapController> _completer = Completer();
  final Set<Marker> _markers = {};

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      //Geolocator로 전달 받은 High 좌표를 현재 위치로 적용
      LatLng _currentLocation = LatLng(position.latitude, position.longitude);
      //Loaded 상태로 업데이트
      emit(GoogleMapLoaded(
          initialCameraPosition: _currentLocation, markers: _markers));
    } catch (e) {
      emit(GoogleMapError("$e: Failed to get current location"));
    }
  }

  Future<void> onMapCreated(GoogleMapController googleMapController) async {
    if (!_completer.isCompleted) {
      _completer.complete(googleMapController);
    }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    emit(GoogleMapCameraMove(cameraPosition: cameraPosition));
  }
}
