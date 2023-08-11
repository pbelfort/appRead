import 'package:app_read/app/domain/question_entity.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required super.uuidQuestion,
    required super.statement,
    required super.optA,
    required super.optB,
    required super.optC,
    required super.optD,
    required super.correctOption,
    required super.type,
  });

  Map<String, dynamic> toJson() => {
        'uuidQuestion': uuidQuestion,
        'statement': statement,
        'optA': optA,
        'optB': optB,
        'optC': optC,
        'optD': optD,
        'correctOption': correctOption,
        'type': type,
      };

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      uuidQuestion: map['id'],
      statement: map['statement'],
      optA: map['opt_a'],
      optB: map['opt_b'],
      optC: map['opt_c'],
      optD: map['opt_d'],
      correctOption: map['correct_option'],
      type: map['type'],
    );
  }
}
