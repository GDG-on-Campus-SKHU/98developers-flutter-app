part of 'google_auth_cubit.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

/** Authentication loading state class */
class GoogleAuthLoading extends GoogleAuthState {}

/** Authentication success state class */
class GoogleAuthSuccess extends GoogleAuthState {
  final User user;

  GoogleAuthSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

/** Authentication failed state class */
class GoogleAuthFailed extends GoogleAuthState {
  final String errorMessage;

  GoogleAuthFailed({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}

/** Sign out failed state class */
class GoogleSignOutFailed extends GoogleAuthState {
  final String errorMessage;

  GoogleSignOutFailed({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
