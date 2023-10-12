import 'package:app_read/app/domain/child_entity.dart';

abstract class IChildProvider {
  Future<bool> register(ChildEntity child);
  Future<List<ChildEntity>> getChildsFromFatherUuid(String fatherUuid);
  Future<bool> deleteChild(String uuidChild);
  Future<bool> updateChild(ChildEntity child);
}
