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