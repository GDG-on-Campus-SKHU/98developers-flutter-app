part of 'challenge_enroll_cubit.dart';

abstract class ChallengeEnrollState extends Equatable {
  const ChallengeEnrollState();

  @override
  List<Object> get props => [];
}

class ChallengeEnrollInitial extends ChallengeEnrollState {}

class ChallengeEnrollLoaded extends ChallengeEnrollState {
  final enrollPostData postData;

  ChallengeEnrollLoaded({required this.postData});

  @override
  List<Object> get props => [postData];
}
