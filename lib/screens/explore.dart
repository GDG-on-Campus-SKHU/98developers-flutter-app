import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/cubits/google_map_cubit.dart';
import 'package:zikiza/utilities/typografie.dart';

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
    final dynamicColor = Theme.of(_).colorScheme;

    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (_, state) {
        if (state is IsMapLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is IsMapError) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Typografie().BodyMedium(
                  "${state.message}",
                  dynamicColor.onBackground,
                ),
                SizedBox(height: 25),
                Typografie().BodyMedium(
                  "Refresh",
                  dynamicColor.onBackground,
                ),
                IconButton(
                  onPressed: () {
                    _.read<GoogleMapCubit>().fetchCurrentLocation();
                  },
                  icon: Icon(Icons.refresh_rounded),
                ),
              ],
            ),
          );
        } else if (state is IsMapLoaded) {
          return _buildGoogleMap(_, state);
        }
        return Container();
      },
    );
  }

  Widget _buildGoogleMap(BuildContext _, IsMapLoaded state) {
    final Completer<GoogleMapController> _googleMapController = Completer();
    final LatLng currentLocation = state.initialCameraPosition;
    final Set<Marker> markers = state.markers;

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: currentLocation,
        zoom: 8.0,
      ),
      onMapCreated: (GoogleMapController googleMapController) {
        if (!_googleMapController.isCompleted) {
          _googleMapController.complete(googleMapController);
        }
      },
      markers: markers,
      onTap: (coordinate) {
        _buildBottomWindow(_, state);
      },
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
    );
  }

  Widget _buildBottomWindow(BuildContext _, IsMapLoaded state) {
    final _width = MediaQuery.of(_).size.width;
    final _height = MediaQuery.of(_).size.height;

    return Container(
      width: _width * 0.6,
      height: _height * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(_).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
