part of 'google_auth_cubit.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

//Loading state
class GoogleAuthLoading extends GoogleAuthState {}

//Success state
class GoogleAuthSuccess extends GoogleAuthState {
  final User user;

  GoogleAuthSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

//Failed state
class GoogleAuthFailed extends GoogleAuthState {
  final String errorMessage;

  GoogleAuthFailed({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
