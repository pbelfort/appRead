import 'package:get/get.dart';

import '../../model/user_register_model.dart';
import '../../provider/register/i_user_register_provider.dart';
import 'i_user_register_repository.dart.dart';

class UserRegisterRepository implements IUserRegisterRepository {
  final IUserRegisterProvider provider;
  UserRegisterRepository({required this.provider});
  @override
  Future<bool> registerUser(UserRegisterModel userRegisterModel) async {
    final response = await provider.registerUser(userRegisterModel);
    return response;
  }

  @override
  Future<Response> confirmToken(
    String email,
    String token,
    String password,
  ) async {
    final response = await provider.confirmToken(
      email,
      token,
      password,
    );
    return response;
  }
}
