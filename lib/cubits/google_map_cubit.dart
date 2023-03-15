import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/models/explore_bundle.dart';
import 'package:zikiza/utilities/constants.dart';

part 'google_map_state.dart';

class GoogleMapCubit extends Cubit<GoogleMapState> {
  final Completer<GoogleMapController> _completer = Completer();

  GoogleMapCubit() : super(MapInitial()) {
    fetchCurrentLocation();
  }

  fetchCurrentLocation() async {
    try {
      emit(IsMapLoading());

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied)
        await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      LatLng currentLocation = LatLng(position.latitude, position.longitude);

      if (state is IsMapLoading) {
        final markers = await fetchPlaceMarkers();
        emit(IsMapLoaded(
            initialCameraPosition: currentLocation, markers: markers));
      }
    } catch (error) {
      emit(IsMapError(message: "${error.toString()}"));
    }
  }

  Future<Set<Marker>> fetchPlaceMarkers() async {
    final ExploreBundle exploreBundle;
    final Set<Marker> markers = Set<Marker>();
    final BitmapDescriptor tertiaryIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(48.0, 48.0),
        devicePixelRatio: 2.5,
      ),
      "assets/images/custom_marker.png",
    );
    Uint8List markerIcon;

    try {
      var response = await http.get(
        Uri.https(
          Constants.host,
          Constants.explore,
        ),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(utf8.decode(response.bodyBytes));

        exploreBundle = ExploreBundle.fromJson(responseData);

        exploreBundle.exploreDataList.forEach(
          (element) async {
            markerIcon = await loadNetworkImage(element.image);
            Marker marker = Marker(
              markerId: MarkerId("${element.id}"),
              icon: BitmapDescriptor.fromBytes(markerIcon),
              position: LatLng(
                element.latitude.toDouble(),
                element.longitude.toDouble(),
              ),
              infoWindow: InfoWindow(
                title: element.name,
                snippet: element.address,
              ),
              onTap: () {},
            );
            markers.add(marker);
          },
        );
        return markers;
      } else {
        emit(IsMapError(message: "Failed to place marker on Google maps."));
      }
    } catch (error) {
      emit(IsMapError(message: "fetchPlaceMarkers: ${error.toString()}"));
    }
    return markers;
  }

  Future<Uint8List> loadNetworkImage(imageUrl) async {
    final completed = Completer<ImageInfo>();
    var image = NetworkImage(imageUrl);
    image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completed.complete(info)));
    final imageInfo = await completed.future;
    final byteData =
        await imageInfo.image.toByteData(format: ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  void onMapCreated(GoogleMapController googleMapController) async {
    if (!_completer.isCompleted) {
      _completer.complete(googleMapController);
    }
  }

  void onCameraMove(CameraPosition cameraPosition) {
    emit(OnCameraMove(cameraPosition: cameraPosition));
  }
}
