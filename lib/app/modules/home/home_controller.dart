import 'package:app_read/app/base/global_controller.dart';
import 'package:app_read/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../data/provider/shared/custom_shared_preferences.dart';
import '../../data/repository/remote/child/i_child_repository.dart';
import '../../domain/child_entity.dart';
import '../../usecases/child/child_usecases.dart';

class HomePageController extends IGlobalController {
  List<ChildEntity> childList = <ChildEntity>[];
  late final String? fatherUuid;
  final IChildRepository iChildRepository;

  HomePageController({required this.iChildRepository});

  @override
  Future<void> onReady() async {
    showLoading.value = true;
    fatherUuid = await CustomSharedPreferences.getUuidUser;
    await getChildList();
    showLoading.value = false;
    super.onReady();
  }

  void goToLoginPage() {
    Get.toNamed(Routes.LOGIN);
  }

  void goToAdminPage() {
    Get.toNamed(Routes.ADMIN);
  }

  Future<void> getChildList() async {
    if (fatherUuid != null) {
      childList = await ChildUsecases.getChildsFromFatherUuid(
        fatherUuid: fatherUuid!,
        iChildRepository: iChildRepository,
      );
    }
  }

  void goToUserBookPage(ChildEntity child) {
    Get.toNamed(
      Routes.USER_BOOK,
      arguments: {
        'child': child,
      },
    );
  }
}
