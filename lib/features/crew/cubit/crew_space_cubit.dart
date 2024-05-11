import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/CrewModel.dart';
import '../data/repository/crew_repository.dart';

part 'crew_space_state.dart';

class CrewSpaceCubit extends Cubit<CrewSpaceState> {

  final CrewRepository crewRepository;
  List <CrewModel> crews = [];

  CrewSpaceCubit(this.crewRepository) : super(CrewSpaceInitial());

  List<CrewModel> getAllCrews() {
    crewRepository.getAllCrews().then((crews){
      emit(CrewLoaded(crews));
      this.crews = crews;
    });

    return crews;
  }
}
