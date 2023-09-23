import 'package:app_read/app/data/provider/remote/quiz/i_quiz_provider.dart';
import 'package:app_read/app/domain/quiz_entity.dart';

import 'i_quiz_repository.dart';

class QuizRepository implements IQuizRepository {
  @override
  final IQuizProvider provider;

  QuizRepository({
    required this.provider,
  });

  @override
  Future<QuizEntity?> getQuizByUuidBook(String uuidBook) {
    return provider.getQuizByUuidBook(uuidBook);
  }

  @override
  Future<bool> updateQuizGrade({
    required String uuidQuiz,
    required int grade,
  }) {
    return provider.updateQuizGrade(
      grade: grade,
      uuidQuiz: uuidQuiz,
    );
  }
}
