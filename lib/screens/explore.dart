import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zikiza/cubits/google_map_cubit.dart';
import 'package:zikiza/utilities/palette.dart';

class ExploreScreen extends StatefulWidget {
  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //MARK: 초기 구글 맵 위치 지정 생성자
  final CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(37.553320, 126.972888));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => GoogleMapCubit(),
          child: BlocConsumer<GoogleMapCubit, GoogleMapState>(
              listener: (context, state) {
            if (state is GoogleMapError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          }, builder: (context, state) {
            if (state is GoogleMapLoaded) {
              return GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: context.read<GoogleMapCubit>().onMapCreated,
                onCameraMove: context.read<GoogleMapCubit>().onCameraMove,
                mapType: MapType.hybrid,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set<Marker>.of(<Marker>[
                  Marker(
                      markerId: MarkerId("marker_1"),
                      position: LatLng(37.565016, 126.849443),
                      infoWindow: const InfoWindow(
                        title: "서울특별시 마포구 상수동",
                        snippet: "상수역 3번 출구에서 도보 3분",
                      )),
                ]),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
