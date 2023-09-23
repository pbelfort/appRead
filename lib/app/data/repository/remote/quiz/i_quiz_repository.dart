import '../../../../domain/quiz_entity.dart';
import '../../../provider/remote/quiz/i_quiz_provider.dart';

abstract class IQuizRepository {
  final IQuizProvider provider;

  IQuizRepository({required this.provider});

  Future<QuizEntity?> getQuizByUuidBook(String uuidBook);

  Future<bool> updateQuizGrade({
    required String uuidQuiz,
    required int grade,
  });
}
