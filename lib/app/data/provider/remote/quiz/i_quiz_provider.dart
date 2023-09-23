import 'package:app_read/app/domain/quiz_entity.dart';

abstract class IQuizProvider {
  Future<QuizEntity?> getQuizByUuidBook(String uuidBook);

  Future<bool> updateQuizGrade({
    required String uuidQuiz,
    required int grade,
  });
}
