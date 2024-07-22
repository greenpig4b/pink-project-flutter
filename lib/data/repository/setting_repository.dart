import 'package:dio/dio.dart';
import 'package:pinkpig_project_flutter/data/dtos/calendar/calendar.dart';
import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/setting/notice_detail.dart';

import '../../_core/constants/http.dart';
import '../dtos/setting/notice_list.dart';

class SettingRepository{

  // 공지사항 리스트
  Future<ResponseDTO> fetchSettingNoticeList() async {
    final response = await dio.get("/api/admin/notice"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeList.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

  // 공지사항 상세보기
  Future<ResponseDTO> fetchNoticeDetail(int id) async {
    final response = await dio.get("/api/admin/notice/${id}"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeDetail.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

  // faq 리스트
  Future<ResponseDTO> fetchSettingFaqList() async {
    final response = await dio.get("/api/admin/faq"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeList.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

  // faq 상세보기
  Future<ResponseDTO> fetchFaqDetail(int id) async {
    final response = await dio.get("/api/admin/faq/${id}"
    );

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if(responseDTO.status == 200) {
      responseDTO.response = NoticeDetail.fromJson(responseDTO.response);

    }

    return responseDTO;
  }

}