import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/quiz_entity_db.dart';
import '../../../model/quiz_model_db.dart';
import 'i_quiz_local_provider.dart';

class QuizLocalProvider implements IQuizLocalProvider {
  @override
  Future<bool> clearQuizDB() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('quiz_list');
  }

  @override
  Future<bool> createQuizInDB(QuizEntityDB quiz) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Fetch and decode data
    final String? quizString = prefs.getString('quiz_list');

    if (quizString != null) {
      final quizes = QuizModelDB.decodeQuizEntity(quizString);

      quizes.add(quiz);
      return await prefs.setString(
        'quiz_list',
        json.encode(
          quizes
              .map<Map<String, dynamic>>(
                  (quiz) => QuizModelDB.fromEntity(quiz).toJson())
              .toList(),
        ),
      );
    }
    List<QuizEntityDB> list = [quiz];
    return await prefs.setString(
      'quiz_list',
      json.encode(
        list
            .map<Map<String, dynamic>>(
                (quiz) => QuizModelDB.fromEntity(quiz).toJson())
            .toList(),
      ),
    );
  }

  @override
  Future<List<QuizEntityDB>> getAllQuizessFromDB() async {
    List<QuizEntityDB> dbListquizs = <QuizEntityDB>[];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? quizString = prefs.getString('quiz_list');

    if (quizString != null) {
      dbListquizs = QuizModelDB.decodeQuizEntity(quizString);
    }
    return dbListquizs;
  }

  @override
  Future<bool> deleteUserQuizFromDB(String uuidChild) async {
    List<QuizEntityDB> dbListquizs = <QuizEntityDB>[];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? quizString = prefs.getString('quiz_list');

    if (quizString != null) {
      dbListquizs = QuizModelDB.decodeQuizEntity(quizString);
      final newList =
          dbListquizs.where((element) => element.uuidChild != uuidChild);
      return await prefs.setString(
        'quiz_list',
        json.encode(
          newList
              .map<Map<String, dynamic>>(
                  (quiz) => QuizModelDB.fromEntity(quiz).toJson())
              .toList(),
        ),
      );
    }
    return false;
  }
}
