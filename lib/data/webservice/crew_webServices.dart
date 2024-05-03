

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:space_x/core/utils/end_points.dart';

class CrewWebServices {

  late Dio dio;

  CrewWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    );

    dio = Dio(options);
  }

  Future <List <dynamic>> getAllCrews() async{
    try{
      Response response = await dio.get('/crew');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch(error){
      if (kDebugMode) {
        print(error.toString());
      }
      return [];
    }
  }


}