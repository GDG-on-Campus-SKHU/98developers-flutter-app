import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/cubits/google_map_cubit.dart';
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

    final Completer<GoogleMapController> _googleMapController = Completer();
    final BitmapDescriptor _markerIcon;
    final dynamicColor = Theme.of(_).colorScheme;
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          //줌 레벨을 설정해서 초기 로드되는 지도의 크기를 축소
          zoom: 7,
        ),
        onMapCreated: (GoogleMapController googleMapController) {
          if (!_googleMapController.isCompleted) {
            _googleMapController.complete(googleMapController);
          }
        },
        markers: {
          Marker(
              markerId: MarkerId("1"),
              position: LatLng(37.7782841, 128.8801178)),
        },
        onTap: (markers) {
          _buildBottomWindow(_, state);
        },
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapToolbarEnabled: true,
      ),
      appBar: LightAppBar(
        color: dynamicColor.background,
        backgroundColor: dynamicColor.surface,
      ),
      backgroundColor: dynamicColor.surface,
    );
  }

  Widget _buildBottomWindow(BuildContext _, GoogleMapLoaded state) {
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
