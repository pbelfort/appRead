import 'dart:convert';
import 'package:get/get_connect.dart';

import '../../../base/enviroment.dart';
import '../../model/user_register_model.dart';
import 'i_user_register_provider.dart';
import 'package:http/http.dart' as http;

class UserRegisterProvider extends GetConnect implements IUserRegisterProvider {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<bool> registerUser(UserRegisterModel userRegisterModel) async {
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, String?>{
            'email': userRegisterModel.email,
            'password': userRegisterModel.password
          },
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
        Uri.parse('${AppEnviroment.baseUrl}/confirmsignup').toString(),
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
}
