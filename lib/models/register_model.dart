class RegisterModel {
  final String username;
  final String password;
  final String full_name;
  final String email;

  RegisterModel({
    required this.username,
    required this.password,
    required this.full_name,
    required this.email,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      username: json['username'],
      password: json['password'],
      full_name: json['full_name'],
      email: json['email'],
    );
  }
}