import 'package:app_read/app/data/repository/local/quiz/i_quiz_local_repository.dart';
import 'package:app_read/app/data/repository/remote/question/i_question_repository.dart.dart';
import 'package:app_read/app/domain/quiz_entity.dart';

import '../../data/repository/remote/quiz/i_quiz_repository.dart';
import '../../domain/question_entity.dart';
import '../../domain/quiz_entity_db.dart';

abstract class QuizUsecases {
  static Future<List<QuestionEntity>> getQuestionList({
    required IQuestionRepository iQuestionRepository,
    required String uuidBook,
  }) async {
    return await iQuestionRepository.getAllQuestionsByQuiz(uuidBook);
  }

  static Future<QuizEntity?> getQuizByUuidBook({
    required IQuizRepository iQuizRepository,
    required String uuidBook,
  }) async {
    return await iQuizRepository.getQuizByUuidBook(uuidBook);
  }

  static updateQuizGrade({
    required IQuizRepository iQuizRepository,
    required String uuidQuiz,
    required int grade,
  }) async {
    return await iQuizRepository.updateQuizGrade(
      uuidQuiz: uuidQuiz,
      grade: grade,
    );
  }

  static Future<bool> saveQuizInDB({
    required IQuizLocalRepository iQuizLocalRepository,
    required QuizEntityDB quizEntity,
  }) async {
    return await iQuizLocalRepository.createQuizInDB(quizEntity);
  }

  static Future<List<QuizEntityDB>> getQuizesFromDB(
      IQuizLocalRepository iQuizLocalRepository) async {
    return await iQuizLocalRepository.getAllQuizessFromDB();
  }
}
