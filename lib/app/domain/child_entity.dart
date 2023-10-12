enum AttributeType {
  name,
  score,
  age,
}

class ChildEntity {
  ChildEntity({
    required this.uuidChild,
    required this.childName,
    required this.age,
    required this.fatherUuid,
    required this.score,
  });

  final String uuidChild;
  final String childName;
  final int age;
  final String fatherUuid;
  final int score;
}
