part of 'google_auth_cubit.dart';

abstract class GoogleAuthState extends Equatable {}

/**
 * Google 계정 인증 상태 초기화 클래스
 */
class GoogleAuthInitial extends GoogleAuthState {
  @override
  List<Object> get props => [];
}

/**
 * Google 계정 로그인 로딩 클래스
 * 인증 state를 로딩으로 변경
 */
class GoogleAuthLoading extends GoogleAuthState {
  @override
  List<Object> get props => [];
}

/**
 * Google 계정 로그인 완료 클래스
 * 인증이 완료된 현재 사용자의 정보를 객체로 전달
 */
class GoogleAuthSuccess extends GoogleAuthState {
  final User user;

  GoogleAuthSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

/**
 * Google 계정 로그인 실패 클래스
 * 인증에 실패하면 에러 메세지를 객체로 전달
 */
class GoogleAuthFailed extends GoogleAuthState {
  final String message;

  GoogleAuthFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

/**
 * Google 계정 로그아웃 완료 클래스
 * 로그아웃이 완료된 현재 사용자의 정보를 모두 삭제
 */
class GoogleSignOutSuccess extends GoogleAuthState {
  @override
  List<Object> get props => [];
}

/**
 * Google 계정 로그아웃 실패 클래스
 * 로그아웃이 실패하면 에러 메세지를 객체로 전달
 */
class GoogleSignOutFailed extends GoogleAuthState {
  final String message;

  GoogleSignOutFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
