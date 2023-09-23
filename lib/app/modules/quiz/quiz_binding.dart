import 'package:get/get.dart';

import '../../data/provider/remote/question/i_question_provider.dart';
import '../../data/provider/remote/question/question_provider.dart';
import '../../data/provider/remote/quiz/i_quiz_provider.dart';
import '../../data/provider/remote/quiz/question_provider.dart';
import '../../data/repository/remote/question/i_question_repository.dart.dart';
import '../../data/repository/remote/question/question_repository.dart';
import '../../data/repository/remote/quiz/i_quiz_repository.dart';
import '../../data/repository/remote/quiz/quiz_repository.dart';
import 'quiz_controller.dart';

class QuizBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IQuizProvider>(
      () => QuizProvider(),
    );
    Get.lazyPut<IQuizRepository>(
      () => QuizRepository(
        provider: Get.find(),
      ),
    );
    Get.lazyPut<IQuestionProvider>(
      () => QuestionProvider(),
    );
    Get.lazyPut<IQuestionRepository>(
      () => QuestionRepository(
        provider: Get.find(),
      ),
    );
    Get.put(
      QuizController(
        iQuizRepository: Get.find<IQuizRepository>(),
        iQuestionRepository: Get.find<IQuestionRepository>(),
      ),
    );
  }
}
