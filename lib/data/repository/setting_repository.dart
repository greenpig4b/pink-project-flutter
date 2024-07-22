import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/calendar/calendar.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_response.dart';

import '../../_core/constants/http.dart';

class SettingRepository{

  Future<ResponseDTO> fetchSettingNoticeList(int userId) async {
    final response = await dio.get("/api/admin/notice/${userId}"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeResponse.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

}