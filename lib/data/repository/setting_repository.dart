import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/calendar/calendar.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_detail_response.dart';

import '../../_core/constants/http.dart';
import '../dtos/setting/notice_list.dart';

class SettingRepository{

  Future<ResponseDTO> fetchSettingNoticeList() async {
    final response = await dio.get("/api/admin/notice"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeList.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

  Future<ResponseDTO> fetchNoticeDetail(int id) async {
    final response = await dio.get("/api/admin/notice/${id}"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeDetail.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

}