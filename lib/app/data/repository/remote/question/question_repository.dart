import 'package:app_read/app/domain/question_entity.dart';
import '../../../provider/remote/question/i_question_provider.dart';
import 'i_question_repository.dart.dart';

class QuestionRepository implements IQuestionRepository {
  final IQuestionProvider provider;
  QuestionRepository({required this.provider});

  @override
  Future<List<QuestionEntity>> getAllQuestionsByQuiz(String uuidBook) async {
    final response = await provider.getAllQuestionsByQuiz(uuidBook);
    return response;
  }
}
