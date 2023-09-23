import '../../../../domain/question_entity.dart';

abstract class IQuestionRepository {
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook);
}
