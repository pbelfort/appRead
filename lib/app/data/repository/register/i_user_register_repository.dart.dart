import 'package:get/get.dart';

import '../../model/user_register_model.dart';

abstract class IUserRegisterRepository {
  Future<bool> registerUser(UserRegisterModel userRegisterModel);
  Future<Response<dynamic>> confirmToken(
    String email,
    String token,
    String password,
  );
}
