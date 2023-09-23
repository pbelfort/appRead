import '../../../../domain/quiz_entity_db.dart';

abstract class IQuizLocalProvider {
  Future<List<QuizEntityDB>> getAllQuizessFromDB();
  Future<bool> createQuizInDB(QuizEntityDB quizEntity);
  Future<bool> clearQuizDB();
}
