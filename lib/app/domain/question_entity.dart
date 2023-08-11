class QuestionEntity {
  QuestionEntity({
    required this.uuidQuestion,
    required this.statement,
    required this.optA,
    required this.optB,
    required this.optC,
    required this.optD,
    required this.type,
    required this.correctOption,
  });

  final String uuidQuestion;
  final String statement;
  final String optA;
  final String optB;
  final String optC;
  final String optD;
  final String type;
  final String correctOption;
}
