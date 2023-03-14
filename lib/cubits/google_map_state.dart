part of 'google_map_cubit.dart';

@immutable
abstract class GoogleMapState extends Equatable {}

/**
 * Google Map 초기화 클래스
 * GoogleMapError state 전환 시 처음부터 로드
 */
class MapInitial extends GoogleMapState {
  @override
  List<Object> get props => [];
}

/**
 * Google Map 로딩 클래스
 * Google Map 로드 이전 state 관리 클래스
 */
class IsMapLoading extends GoogleMapState {
  @override
  List<Object> get props => [];
}

/**
 * Google Map 에러 클래스
 * 성공적으로 로드하지 못했다면 에러 메세지 전달
 */
class IsMapError extends GoogleMapState {
  final String message;

  IsMapError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

/**
 * Google Map 빌드 클래스
 * 문제 없이 성공적으로 Google Map이 로드 되었을 경우의 상태 관리 클래스
 * 초기 카메라 위치와 마커 데이터 번들 객체를 전달
 */
class IsMapLoaded extends GoogleMapState {
  final LatLng initialCameraPosition;

  IsMapLoaded({
    required this.initialCameraPosition,
  });

  @override
  List<Object> get props => [initialCameraPosition];
}

class OnCameraMove extends GoogleMapState {
  final CameraPosition cameraPosition;

  OnCameraMove({
    required this.cameraPosition,
  });

  @override
  List<Object> get props => [cameraPosition];
}
