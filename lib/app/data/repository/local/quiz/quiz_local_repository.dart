import '../../../../domain/quiz_entity_db.dart';
import '../../../provider/local/quiz/i_quiz_local_provider.dart';
import 'i_quiz_local_repository.dart';

class QuizLocalRepository implements IQuizLocalRepository {
  final IQuizLocalProvider provider;

  const QuizLocalRepository({
    required this.provider,
  });

  @override
  Future<bool> clearQuizDB() {
    return provider.clearQuizDB();
  }

  @override
  Future<bool> createQuizInDB(QuizEntityDB quiz) {
    return provider.createQuizInDB(quiz);
  }

  @override
  Future<List<QuizEntityDB>> getAllQuizessFromDB() {
    return provider.getAllQuizessFromDB();
  }
}
