import 'package:pinkpig_project_flutter/data/dtos/response_dto.dart';
import 'package:pinkpig_project_flutter/data/dtos/user/user_request.dart';
import 'package:pinkpig_project_flutter/data/dtos/user/user_response.dart';

import '../../_core/constants/http.dart';
import '../models/User.dart';

class UserRepository {
  Future<(ResponseDTO, String)> fetchLogin(LoginRequestDTO requestDTO) async {
    final response = await dio.post("/login", data: requestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.status == 200) {
      responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }

  Future<ResponseDTO> fetchJoin(JoinRequestDTO joinRequestDTO) async {
    final response = await dio.post("/join", data: joinRequestDTO.toJson());

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    return responseDTO;
  }

  Future<EmailCheckDTO> fetchEmailCheck(String email) async {
    final response =
        await dio.get("/check-email", queryParameters: {'email': email});
    EmailCheckDTO emailCheckDTO = EmailCheckDTO.fromJson(response.data);

    return emailCheckDTO;
  }

  Future<(ResponseDTO, String)> fetchKakaoLogin(String kakaoAccessToken) async {
    final response = await dio.get("/oauth/callback/kakao",
        queryParameters: {"accessToken": kakaoAccessToken});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    print("responseDTO 결과 : ${responseDTO.response}");
    if (responseDTO.status == 200) {
      // responseDTO.response = User.fromJson(responseDTO.response);
      final accessToken = response.headers["Authorization"]!.first;
      return (responseDTO, accessToken);
    } else {
      return (responseDTO, "");
    }
  }
}
