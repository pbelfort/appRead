import 'package:app_read/app/data/repository/remote/question/i_question_repository.dart.dart';
import 'package:app_read/app/domain/quiz_entity.dart';

import '../../data/repository/remote/quiz/i_quiz_repository.dart';
import '../../domain/question_entity.dart';

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
}
