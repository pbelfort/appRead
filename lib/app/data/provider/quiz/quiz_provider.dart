import 'dart:convert';

import 'package:app_read/app/data/model/question_model.dart';
import 'package:get/get_connect.dart';

import '../../../base/enviroment.dart';
import '../../../domain/question_entity.dart';
import 'i_quiz_provider.dart';
import 'package:http/http.dart' as http;

class QuizProvider extends GetConnect implements IQuizProvider {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
    super.onInit();
  }

  @override
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook) async {
    List<QuestionEntity> questions = <QuestionEntity>[];
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/question/searchQuestionByUuidBook'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, String?>{
            'uuidBook': uuidBook,
          },
        ),
      );

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body)['question'] as List;
        for (var question in decodedResponse) {
          questions.add(QuestionModel.fromMap(question));
        }
      }
      return questions;
    } catch (e) {
      rethrow;
    }
  }
}
