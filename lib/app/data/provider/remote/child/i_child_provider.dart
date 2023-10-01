import 'package:app_read/app/domain/child_entity.dart';

abstract class IChildProvider {
  Future<bool> register(ChildEntity child);

  Future<List<ChildEntity>> getChildsFromFatherUuid(String fatherUuid);
}
