import 'dart:convert';

import 'package:app_read/app/domain/quiz_entity.dart';

import '../../../../base/enviroment.dart';
import '../../../model/quiz_model.dart';
import 'i_quiz_provider.dart';
import 'package:http/http.dart' as http;

class QuizProvider implements IQuizProvider {
  @override
  Future<QuizEntity?> getQuizByUuidBook(String uuidBook) async {
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/quiz/searchByUuidBook'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, dynamic>{
            'uuidBook': uuidBook,
          },
        ),
      );

      return QuizModel.fromMap(jsonDecode(response.body)[0]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateQuizGrade({
    required String uuidQuiz,
    required int grade,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/quiz/updateQuizGrade'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, dynamic>{
            "id": uuidQuiz,
            "grade": grade,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
