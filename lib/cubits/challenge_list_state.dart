part of 'challenge_list_cubit.dart';

abstract class ChallengeListState extends Equatable {
  const ChallengeListState();

  @override
  List<Object> get props => [];
}

class ChallengeListInitial extends ChallengeListState {}

class ChallengeListLoaded extends ChallengeListState {
  final getChallengeList list;

  ChallengeListLoaded(this.list);
  @override
  List<Object> get props => [list];
}
