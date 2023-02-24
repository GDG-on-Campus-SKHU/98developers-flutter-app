import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/utilities/palette.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //MARK: 지도를 create 하기 위한 컨트롤러
  final Completer<GoogleMapController> _googleMapController =
      Completer<GoogleMapController>();

  //MARK: 초기 구글 맵 위치 지정 생성자
  final CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(37.553320, 126.972888));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.white,
        body: SafeArea(
          child: GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _googleMapController.complete(controller);
              });
            },
          ),
        ));
  }
}
