import 'package:app_read/app/data/repository/quiz/i_quiz_repository.dart.dart';

import '../../domain/question_entity.dart';

abstract class QuizUsecases {
  static Future<List<QuestionEntity>> getQuestionList({
    required IQuizRepository iQuizRepository,
    required String uuidBook,
  }) async {
    return await iQuizRepository.getAllQuestionsByQuiz(uuidBook);
  }
}
