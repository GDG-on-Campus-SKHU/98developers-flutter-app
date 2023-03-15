import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/cubits/google_map_cubit.dart';
import 'package:zikiza/utilities/typografie.dart';
import 'package:zikiza/widgets/light_appbar.dart';

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
          if (Platform.isIOS) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
          return Scaffold(
            body: _buildGoogleMap(_, state),
            appBar: LightAppBar(
              title: Typografie().HeadlineSmall(
                "Explore",
                Theme.of(_).colorScheme.onPrimaryContainer,
              ),
              backgroundColor: Theme.of(_).colorScheme.background,
            ),
          );
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
        print(markers);
      },
      markers: markers,
      mapType: MapType.normal,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: true,
      scrollGesturesEnabled: true,
      rotateGesturesEnabled: false,
      minMaxZoomPreference: MinMaxZoomPreference.unbounded,
      cameraTargetBounds: CameraTargetBounds.unbounded,
    );
  }
}
