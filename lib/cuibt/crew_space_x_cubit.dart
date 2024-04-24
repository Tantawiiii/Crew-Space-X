import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'crew_space_x_state.dart';

class CrewSpaceXCubit extends Cubit<CrewSpaceXState> {
  CrewSpaceXCubit() : super(CrewSpaceXInitial());
}
