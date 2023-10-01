import '../../../../domain/child_entity.dart';
import '../../../provider/remote/child/i_child_provider.dart';

abstract class IChildRepository {
  final IChildProvider provider;
  IChildRepository({required this.provider});

  Future<bool> registerChild(ChildEntity child);

  Future<List<ChildEntity>> getChildsFromFatherUuid(String fatherUuid);
}
