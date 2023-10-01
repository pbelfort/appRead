import 'package:app_read/app/data/repository/remote/child/i_child_repository.dart';

import '../../domain/child_entity.dart';

abstract class ChildUsecases {
  static Future<bool> registerChild({
    required ChildEntity child,
    required IChildRepository iChildRepository,
  }) async {
    return await iChildRepository.registerChild(child);
  }

  static Future<List<ChildEntity>> getChildsFromFatherUuid({
    required String fatherUuid,
    required IChildRepository iChildRepository,
  }) async {
    return await iChildRepository.getChildsFromFatherUuid(fatherUuid);
  }
}