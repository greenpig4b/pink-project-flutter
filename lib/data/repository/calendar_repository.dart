import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/calendar/calendar.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';

import '../../_core/constants/http.dart';

class CalendarRepository{

  Future<ResponseDTO> fetchCalendarList(int year, int month) async {
    final response = await dio.get("/api/calendar",
      queryParameters: {'year' : year, 'month' : month}
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = Calendar.fromJson(responseDTO.response);
    }

    return responseDTO;
  }

}