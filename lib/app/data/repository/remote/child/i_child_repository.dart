import '../../../../domain/child_entity.dart';
import '../../../provider/remote/child/i_child_provider.dart';

abstract class IChildRepository {
  final IChildProvider provider;
  IChildRepository({required this.provider});

  Future<ChildEntity?> registerChild(ChildEntity child);
  Future<List<ChildEntity>> getChildsFromFatherUuid(String fatherUuid);
  Future<bool> deleteChild(String uuidChild);
  Future<bool> updateChild(ChildEntity child);
}
