import 'package:get/get_connect.dart';

import '../../model/user_register_model.dart';
// import 'package:gou_mobile_clientes/app/data/model/user/endereco_model.dart';

abstract class IUserRegisterProvider {
  Future<bool> registerUser(UserRegisterModel userRegisterModel);
  Future<Response<dynamic>> confirmToken(
    String email,
    String token,
    String password,
  );
}
