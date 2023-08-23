import 'dart:convert';
import 'package:app_read/app/data/model/user_register_model.dart';
import 'package:app_read/app/domain/user_entity.dart';
import 'package:get/get_connect.dart';

import '../../../../base/enviroment.dart';
import 'i_user_register_provider.dart';
import 'package:http/http.dart' as http;

class UserRegisterProvider extends GetConnect implements IUserRegisterProvider {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<bool> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, String?>{'email': email, 'password': password},
        ),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> confirmToken(
    String email,
    String token,
    String password,
  ) async {
    int responseStatusCode = 0;
    try {
      final response = await post(
        Uri.parse('${AppEnviroment.baseUrl}/register/confirmsignup').toString(),
        jsonEncode(
          <String, dynamic>{
            'data': {
              'email': email,
              'code': token,
              'password': password,
            }
          },
        ),
      );
      responseStatusCode = response.statusCode!;
      if (response.statusCode == 200) {
        return Response(
          statusCode: response.statusCode,
          statusText: response.statusText,
          body: response.body ?? {},
        );
      }
    } catch (e) {
      rethrow;
    }

    return Response(
      statusCode: responseStatusCode,
      statusText: 'Error in api',
    );
  }

  @override
  Future<UserEntity?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await post(
        Uri.parse('${AppEnviroment.baseUrl}/register/signIn').toString(),
        jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final error = response.body['401'];

        if (error != null) {
          print(error);
          return null;
        }
        return UserModel.fromMap(response.body['user']);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<int> signOut() async {
    try {
      final response = await post(
        Uri.parse('${AppEnviroment.baseUrl}/register/signOut').toString(),
        '',
      );
      return response.statusCode!;
    } catch (e) {
      print(e);
    }
    return 404;
  }
}
