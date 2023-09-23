import 'dart:convert';
import '../../domain/quiz_entity_db.dart';

class QuizModelDB extends QuizEntityDB {
  QuizModelDB({
    required super.bookName,
    required super.grade,
  });

  Map<String, dynamic> toJson() => {
        'bookName': bookName,
        'grade': grade,
      };

  factory QuizModelDB.fromMap(Map<String, dynamic> map) {
    return QuizModelDB(
      bookName: map['bookName'],
      grade: map['grade'],
    );
  }

  static List<QuizEntityDB> decodeQuizEntity(String quizString) {
    return (json.decode(quizString) as List<dynamic>)
        .map<QuizEntityDB>((item) => QuizModelDB.fromMap(item))
        .toList();
  }

  factory QuizModelDB.fromEntity(QuizEntityDB quiz) {
    return QuizModelDB(
      bookName: quiz.bookName,
      grade: quiz.grade,
    );
  }
}
