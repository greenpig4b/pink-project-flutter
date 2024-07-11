import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// mac : ipconfig getifaddr en0
String serverAddress = "http://192.168.11.171:8080";

final dio = Dio(
  BaseOptions(
    baseUrl: serverAddress, // IPConfig 로 ip 확인하기⁷
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true, // 200 이 아니어도 예외 발생안하게 설정
  ),
);

const secureStorage = FlutterSecureStorage();
// 인터셉터 생성
var interceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    //토큰을 secureStorage에서 읽는다.
    var accessToken = await secureStorage.read(key: 'accessToken');
    print("onRequest 토큰: $accessToken");

    if (accessToken != null) {
      options.headers["Authorization"] = "Bearer $accessToken";
    } else {
      print("나 토큰이 없어");
    }
    return handler.next(options);
  },
  onResponse: (response, handler) async {
    var authorizationHeader = response.headers["Authorization"];
    if (authorizationHeader != null) {
      var accessToken = authorizationHeader[0].split("Bearer ")[1];
      print("onResponse 토큰: " + accessToken);
      await secureStorage.write(key: "accessToken", value: accessToken);
    }
    return handler.next(response);
  },
  onError: (error, handler) {
    //요청, 응답 오류일때
    return handler.next(error);
  },
);
