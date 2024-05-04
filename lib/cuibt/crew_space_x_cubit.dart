import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:space_x/data/models/CrewModel.dart';

import '../data/repository/crew_repository.dart';

part 'crew_space_x_state.dart';

class CrewSpaceXCubit extends Cubit<CrewSpaceXState> {

  final CrewRepository crewRepository;
    List <CrewModel> crews = [];

  CrewSpaceXCubit(this.crewRepository) : super(CrewSpaceXInitial());

  List<CrewModel> getAllCrews() {
    crewRepository.getAllCrews().then((crews){
      emit(CrewLoaded(crews));
      this.crews = crews;
    });

    return crews;
  }


}
