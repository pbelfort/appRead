import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/domain/child_entity.dart';
import 'package:app_read/app/domain/quiz_entity.dart';
import 'package:app_read/app/domain/quiz_entity_db.dart';
import 'package:app_read/app/modules/quiz/quiz_page.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
import '../../data/repository/local/quiz/i_quiz_local_repository.dart';
import '../../data/repository/remote/question/i_question_repository.dart.dart';
import '../../data/repository/remote/quiz/i_quiz_repository.dart';
import '../../domain/question_entity.dart';
import '../../usecases/quiz/quiz_usecases.dart';

class QuizController extends IGlobalController {
  final String? uuidBook = Get.parameters['uuid_book'];
  final String? bookName = Get.parameters['book_title'];
  final ChildEntity? child = Get.arguments['child'];

  final IQuestionRepository iQuestionRepository;
  final IQuizRepository iQuizRepository;
  final IQuizLocalRepository iQuizLocalRepository;
  List<QuestionEntity> questions = [];
  int correctAnswerCounter = 0;
  int grade = 0;

  // Define a Map to store selected options for each question
  final Map<QuestionEntity, ChoiceOption> selectedOptions = {};
  late QuizEntity? quizEntity;

  RxBool finishButtonEnabled = false.obs;

  QuizController({
    required this.iQuestionRepository,
    required this.iQuizLocalRepository,
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
  void selectOption({
    required QuestionEntity question,
    required ChoiceOption option,
  }) {
    showLoading.value = true;
    selectedOptions[question] = option;
    finishButtonEnabled.value = selectedOptions.length == questions.length;
    showLoading.value = false;
  }

  finishQuiz() async {
    selectedOptions.forEach(
      (question, option) {
        switch (option) {
          case ChoiceOption.optA:
            if (question.correctOption == question.optA) {
              correctAnswerCounter += 1;
            }
            break;
          case ChoiceOption.optB:
            if (question.correctOption == question.optB) {
              correctAnswerCounter += 1;
            }
            break;
          case ChoiceOption.optC:
            if (question.correctOption == question.optC) {
              correctAnswerCounter += 1;
            }
            break;
          case ChoiceOption.optD:
            if (question.correctOption == question.optD) {
              correctAnswerCounter += 1;
            }

            break;
        }
      },
    );
    grade = ((correctAnswerCounter / questions.length) * 100).toInt();
    if (child == null) return;
    //update grade quiz
    if (quizEntity != null) {
      final updated = await QuizUsecases.updateQuizGrade(
        iQuizRepository: iQuizRepository,
        uuidQuiz: quizEntity!.uuidQuiz,
        grade: grade.toInt(),
      );
      if (updated) {
        await QuizUsecases.saveQuizInDB(
          iQuizLocalRepository: iQuizLocalRepository,
          quizEntity: QuizEntityDB(
            uuidChild: child!.uuidChild,
            bookName: bookName!,
            grade: grade,
          ),
        );
      }
    }

    //update user score

    final quizes = await QuizUsecases.getQuizesFromDB(iQuizLocalRepository);

    quizes.removeWhere((element) => element.uuidChild != child!.uuidChild);

    int quizesPercent = quizes.length * 100;

    final score = (((quizes
                    .map((e) => e.grade)
                    .reduce((value, element) => value + element)) /
                quizesPercent) *
            100)
        .toInt();

    CustomSharedPreferences.saveScoreUserInSharedPreferences(
      uuidChild: child!.uuidChild,
      score: score.toString(),
    );

    //get off all named home
    Get.offAllNamed(Routes.USER_BOOK, arguments: {
      'child': child,
    });
  }
}
