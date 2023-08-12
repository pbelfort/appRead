import 'package:app_read/app/domain/user_entity.dart';
import 'package:get/get.dart';

import '../../provider/register/i_user_register_provider.dart';
import 'i_user_register_repository.dart.dart';

class UserRegisterRepository implements IUserRegisterRepository {
  final IUserRegisterProvider provider;
  UserRegisterRepository({required this.provider});
  @override
  Future<bool> registerUser({
    required String email,
    required String password,
  }) async {
    final response = await provider.registerUser(
      email: email,
      password: password,
    );
    return response;
  }

  @override
  Future<Response> confirmToken({
    required String email,
    required String token,
    required String password,
  }) async {
    final response = await provider.confirmToken(
      email,
      token,
      password,
    );
    return response;
  }

  @override
  Future<UserEntity?> signIn({
    required String email,
    required String password,
  }) async {
    final response = await provider.signIn(
      email: email,
      password: password,
    );
    return response;
  }

  @override
  Future<int> signOut() async {
    final response = await provider.signOut();
    return response;
  }
}
