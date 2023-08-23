import 'package:get/get.dart';

import '../../data/provider/remote/library/i_library_provider.dart';
import '../../data/provider/remote/library/library_provider.dart';
import '../../data/repository/remote/library/i_library_repository.dart.dart';
import '../../data/repository/remote/library/library_repository.dart';
import 'library_controller.dart';

class LibraryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILibraryProvider>(() => LibraryProvider());
    Get.lazyPut<ILibraryRepository>(
        () => LibraryRepository(provider: Get.find()));
    Get.put(
      LibraryController(iLibraryRepository: Get.find<ILibraryRepository>()),
    );
  }
}
