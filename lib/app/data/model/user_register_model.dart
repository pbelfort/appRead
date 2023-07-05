import 'dart:convert';

// userRegisterModel userRegisterModelFromJson(str) => userRegisterModel.fromJson(str);

String userRegisterModelToJson(UserRegisterModel data) =>
    json.encode(data.toJson());

class UserRegisterModel {
  UserRegisterModel({
    this.name,
    this.email,
    this.password,
    this.token,
  });

  String? name;
  String? email;
  String? password;
  String? token;

  UserRegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? token,
  }) {
    return UserRegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'token': token,
      };
}
