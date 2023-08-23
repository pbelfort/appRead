import 'package:app_read/app/domain/question_entity.dart';

abstract class IQuizProvider {
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook);
}
