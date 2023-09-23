import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/domain/quiz_entity.dart';
import 'package:app_read/app/modules/quiz/quiz_page.dart';
import 'package:get/get.dart';

import '../../data/repository/remote/question/i_question_repository.dart.dart';
import '../../data/repository/remote/quiz/i_quiz_repository.dart';
import '../../domain/question_entity.dart';
import '../../usecases/quiz/quiz_usecases.dart';

class QuizController extends IGlobalController {
  final String? uuidBook = Get.parameters['uuidBook'];
  final IQuestionRepository iQuestionRepository;
  final IQuizRepository iQuizRepository;

  List<QuestionEntity> questions = [];
  int score = 0;
  double percent = 0.0;

  // Define a Map to store selected options for each question
  final Map<QuestionEntity, ChoiceOption> selectedOptions = {};

  late QuizEntity? quizEntity;

  QuizController({
    required this.iQuestionRepository,
    required this.iQuizRepository,
  });

  @override
  Future<void> onInit() async {
    showLoading.value = true;
    quizEntity = await QuizUsecases.getQuizByUuidBook(
      iQuizRepository: iQuizRepository,
      uuidBook: uuidBook!,
    );
    questions = await QuizUsecases.getQuestionList(
      iQuestionRepository: iQuestionRepository,
      uuidBook: uuidBook!,
    );
    showLoading.value = false;
    super.onInit();
  }

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

  finishQuiz() {
    selectedOptions.forEach(
      (question, option) {
        switch (option) {
          case ChoiceOption.optA:
            if (question.correctOption == question.optA) score += 1;
            break;
          case ChoiceOption.optB:
            if (question.correctOption == question.optB) score += 1;
            break;
          case ChoiceOption.optC:
            if (question.correctOption == question.optC) score += 1;
            break;
          case ChoiceOption.optD:
            if (question.correctOption == question.optD) score += 1;

            break;
        }
      },
    );
    percent = (score / questions.length) * 100;

    //set grade quiz

    //update user score

    //get off all named home

    print(score);
    print(percent.toStringAsFixed(2));
  }
}
