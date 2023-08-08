import 'package:get/get.dart';

import '../../data/provider/library/i_library_provider.dart';
import '../../data/provider/library/library_provider.dart';
import '../../data/repository/library/i_library_repository.dart.dart';
import '../../data/repository/library/library_repository.dart';
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
