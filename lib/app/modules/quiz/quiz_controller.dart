import 'package:app_read/app/base/custom_controller.dart';
import 'package:app_read/app/modules/quiz/quiz_page.dart';
import 'package:get/get.dart';

import '../../data/repository/quiz/i_quiz_repository.dart.dart';
import '../../domain/question_entity.dart';
import '../../usecases/quiz/quiz_usecases.dart';

class QuizController extends ICustomController {
  final String? uuidBook = Get.parameters['uuidBook'];
  final IQuizRepository iQuizRepository;

  List<QuestionEntity> questions = [];

  QuizController({required this.iQuizRepository});

  @override
  Future<void> onInit() async {
    showLoading.value = true;
    questions = await QuizUsecases.getQuestionList(
      iQuizRepository: iQuizRepository,
      uuidBook: uuidBook!,
    );
    showLoading.value = false;
    super.onInit();
  }

  // Define a Map to store selected options for each question
  final Map<QuestionEntity, ChoiceOption> selectedOptions = {};

  // This method should return the selected option for a given question
  ChoiceOption? getSelectedOption(QuestionEntity question) {
    if (selectedOptions.containsKey(question)) {
      return selectedOptions[question]!;
    }
    return null;
  }

  // Method to update the selected option for a question
  void selectOption(QuestionEntity question, ChoiceOption option) {
    showLoading.value = true;
    selectedOptions[question] = option;
    showLoading.value = false;
  }
}
