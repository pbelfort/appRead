import 'package:get/get_connect.dart';

import '../../../domain/user_entity.dart';

// import 'package:gou_mobile_clientes/app/data/model/user/endereco_model.dart';

abstract class IUserRegisterProvider {
  Future<bool> registerUser({
    required String email,
    required String password,
  });

  Future<Response<dynamic>> confirmToken(
    String email,
    String token,
    String password,
  );

  Future<UserEntity?> signIn({
    required String email,
    required String password,
  });
  Future<int> signOut();
}
