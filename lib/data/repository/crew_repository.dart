import 'package:space_x/data/models/CrewModel.dart';
import 'package:space_x/data/webservice/crew_webServices.dart';

class CrewRepository {
  final CrewWebServices crewWebServices;
  CrewRepository(this.crewWebServices);

  Future<List<dynamic>> getAllCrews() async {
    final crews = await crewWebServices.getAllCrews();
    return crews.map((crews) => CrewModel.fromJson(crews)).toList();
  }



}
