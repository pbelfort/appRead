import 'package:app_read/app/data/provider/remote/child/i_child_provider.dart';
import 'package:app_read/app/domain/child_entity.dart';

import 'i_child_repository.dart';

class ChildRepository implements IChildRepository {
  @override
  final IChildProvider provider;

  ChildRepository({required this.provider});

  @override
  Future<ChildEntity?> registerChild(ChildEntity child) {
    return provider.register(child);
  }

  @override
  Future<List<ChildEntity>> getChildsFromFatherUuid(String fatherUuid) {
    return provider.getChildsFromFatherUuid(fatherUuid);
  }

  @override
  Future<bool> deleteChild(String uuidChild) {
    return provider.deleteChild(uuidChild);
  }

  @override
  Future<bool> updateChild(ChildEntity child) {
    return provider.updateChild(child);
  }
}
