import 'package:get/get.dart';

import '../../../../domain/user_entity.dart';

abstract class IUserRegisterRepository {
  Future<bool> registerUser({
    required String email,
    required String password,
  });
  Future<Response<dynamic>> confirmToken({
    required String email,
    required String token,
    required String password,
  });
  Future<UserEntity?> signIn({
    required String email,
    required String password,
  });

  Future<int> signOut();
}
