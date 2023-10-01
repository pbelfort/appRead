import 'dart:convert';

import 'package:app_read/app/data/model/question_model.dart';
import '../../../../base/enviroment.dart';
import '../../../../domain/question_entity.dart';
import 'i_question_provider.dart';
import 'package:http/http.dart' as http;

class QuestionProvider implements IQuestionProvider {
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
