import 'package:app_read/app/domain/question_entity.dart';
import '../../provider/quiz/i_quiz_provider.dart';
import 'i_quiz_repository.dart.dart';

class QuizRepository implements IQuizRepository {
  final IQuizProvider provider;
  QuizRepository({required this.provider});

  @override
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook) async {
    final response = await provider.getAllQuestionsByQuiz(uuidBook);
    return response;
  }
}
