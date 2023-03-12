part of 'place_marker_cubit.dart';

abstract class PlaceMarkerState extends Equatable {
  const PlaceMarkerState();

  @override
  List<Object> get props => [];
}

//초기화 상태 클래스
class PlaceMarkerInitial extends PlaceMarkerState {}

//마커 패칭 실패 상태 클래스
class FetchMarkerFailed extends PlaceMarkerState {
  final String errorMessage;

  FetchMarkerFailed({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
