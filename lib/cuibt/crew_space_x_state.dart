part of 'crew_space_x_cubit.dart';

@immutable
sealed class CrewSpaceXState {}

final class CrewSpaceXInitial extends CrewSpaceXState {}

class CrewLoaded extends CrewSpaceXState {

  final List<CrewModel> crews;

  CrewLoaded(this.crews);


}