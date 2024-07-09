class ResponseDTO {
  final bool? success;
  final int? status;
  final String? errorMessage;
  dynamic response;


  ResponseDTO({this.success, this.status, this.errorMessage, this.response});

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        success = json["success"],
        errorMessage = json["errorMessage"],
        response = json["response"];
}
