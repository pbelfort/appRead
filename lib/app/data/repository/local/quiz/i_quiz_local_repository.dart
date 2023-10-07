import '../../../../domain/quiz_entity_db.dart';

abstract class IQuizLocalRepository {
  Future<List<QuizEntityDB>> getAllQuizessFromDB();
  Future<bool> createQuizInDB(QuizEntityDB quizEntityDB);
  Future<bool> clearQuizDB();
  Future<bool> deleteUserQuizFromDB(String uuidChild);
}
