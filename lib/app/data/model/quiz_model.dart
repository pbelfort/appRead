import 'package:app_read/app/domain/quiz_entity.dart';

class QuizModel extends QuizEntity {
  QuizModel({
    required super.uuidQuiz,
    required super.uuidBook,
    required super.grade,
  });

  Map<String, dynamic> toMap() => {
        'uuidQuiz': uuidQuiz,
        'uuidBook': uuidBook,
        'grade': grade,
      };

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      uuidQuiz: map['id'],
      uuidBook: map['quizQuizBookId'],
      grade: map['grade'],
    );
  }
}
