import 'package:get/get.dart';

import '../../data/provider/remote/child/child_provider.dart';
import '../../data/provider/remote/child/i_child_provider.dart';
import '../../data/repository/remote/child/child_repository.dart';
import '../../data/repository/remote/child/i_child_repository.dart';
import 'admin_controller.dart';

class AdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IChildProvider>(
      () => ChildProvider(),
    );
    Get.lazyPut<IChildRepository>(
      () => ChildRepository(
        provider: Get.find(),
      ),
    );
    Get.put(
      AdminController(
        iChildRepository: Get.find<IChildRepository>(),
      ),
    );
  }
}
