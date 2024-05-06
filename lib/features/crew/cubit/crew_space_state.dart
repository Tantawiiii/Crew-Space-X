part of 'crew_space_cubit.dart';

@immutable
sealed class CrewSpaceState {}

final class CrewSpaceInitial extends CrewSpaceState {}
class CrewLoaded extends CrewSpaceState {

  final List<CrewModel> crews;

  CrewLoaded(this.crews);


}