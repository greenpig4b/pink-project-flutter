class EmailCheckDTO{
  final String? msg;

  EmailCheckDTO(this.msg);

  EmailCheckDTO.fromJson(Map<String, dynamic> json)
      : msg = json["msg"];

}