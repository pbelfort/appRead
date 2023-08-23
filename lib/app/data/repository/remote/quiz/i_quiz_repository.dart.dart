import '../../../../domain/question_entity.dart';

abstract class IQuizRepository {
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook);
}
