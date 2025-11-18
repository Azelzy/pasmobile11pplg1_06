class LoginModel {
  final String username;
  final String password;
  final String token;

  LoginModel({
    required this.username,
    required this.password,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      token: json['token'] ?? '',
    );
  }
}