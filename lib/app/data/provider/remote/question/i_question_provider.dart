import 'package:app_read/app/domain/question_entity.dart';

abstract class IQuestionProvider {
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook);
}
