import '../../domain/child_entity.dart';

class ChildModel extends ChildEntity {
  ChildModel({
    required super.uuidChild,
    required super.childName,
    required super.age,
    required super.fatherUuid,
    required super.score,
  });

  Map<String, dynamic> toMap() => {
        'name': childName,
        'age': age,
        'fatherUuid': fatherUuid,
        'score': score,
      };

  factory ChildModel.fromEntity(ChildEntity entity) {
    return ChildModel(
      uuidChild: entity.uuidChild,
      childName: entity.childName,
      age: entity.age,
      fatherUuid: entity.fatherUuid,
      score: entity.score,
    );
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      uuidChild: map['id'],
      childName: map['name'],
      age: map['age'],
      fatherUuid: map['fatherUuid'],
      score: map['score'],
    );
  }
}
