class LoginRequestDTO{
  final String email;
  final String password;

  LoginRequestDTO(this.email, this.password);

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "password": password,
      };

}

class JoinRequestDTO{
  final String email;
  final String password ;

  JoinRequestDTO(this.email, this.password);

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "password": password,
      };

}