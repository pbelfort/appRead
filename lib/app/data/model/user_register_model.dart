import 'package:app_read/app/domain/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uuid,
    required super.email,
    required super.token,
  });

  Map<String, dynamic> toJson() => {
        'name': uuid,
        'email': email,
        'token': token,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['uuid'],
      email: map['email'],
      token: map['access_token'],
    );
  }
}
