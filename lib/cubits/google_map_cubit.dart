import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/models/markers.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit() : super(GoogleMapLoading()) {
    _getCurrentLocation();
    _fetchExploreMarkers();
  }

  final Completer<GoogleMapController> _completer = Completer();
  final Set<Marker> _markers = Set<Marker>();

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
    } catch (error) {
      emit(GoogleMapError("$error: Failed to get current location"));
    }
  }

  _fetchExploreMarkers() async {
    const url = "https://zikiza.duckdns.org/explore";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final response_data = json.decode(utf8.decode(response.bodyBytes));
        log("${response_data}");
        final _markers = Markers.fromJson(response_data);
        log("_markers: ${_markers}");
        return new Markers.fromJson(response_data);
      } else {
        log("Something went wrong.");
      }
    } catch (error) {
      emit(GoogleMapError("$error: Failed to fetch explore markers."));
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
