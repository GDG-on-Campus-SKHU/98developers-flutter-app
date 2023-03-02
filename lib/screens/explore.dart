import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/cubits/google_map_cubit.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (_) => GoogleMapCubit(),
      child: GoogleMapWidget(),
    );
  }
}

class GoogleMapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (_, state) {
        if (state is GoogleMapLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GoogleMapError) {
          return Center(
            child: Text("${state.errorMessage}"),
          );
        } else if (state is GoogleMapLoaded) {
          return _buildGoogleMap(_, state);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildGoogleMap(BuildContext _, GoogleMapLoaded state) {
    final LatLng currentLocation = state.initialCameraPosition;
    final Set<Marker> markers = state.markers;
    final Completer<GoogleMapController> _googleMapController = Completer();
    final dynamicColor = Theme.of(_).colorScheme;
    return SafeArea(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
        ),
        onMapCreated: (GoogleMapController googleMapController) {
          if (!_googleMapController.isCompleted) {
            _googleMapController.complete(googleMapController);
          }
        },
        markers: markers,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapToolbarEnabled: true,
      ),
    );
  }
}
