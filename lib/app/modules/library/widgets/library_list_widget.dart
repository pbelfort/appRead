import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/book_entity.dart';
import '../../../theme/app_colors.dart';
import '../../widgets/custom_card_widget.dart';
import '../library_controller.dart';

class LibraryItems extends GetView<LibraryController> {
  const LibraryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Obx(() {
            if (!controller.showLoading.value &&
                controller.searchEditingController.text.isNotEmpty) {
              return _listViewContructor(controller.searchBookList);
            }
            return _listViewContructor(controller.bookList);
          }),
        ),
      ),
    );
  }

  Widget _listViewContructor(List<BookEntity> widgetList) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...widgetList.map(
          (book) => CustomCardWidget(
            action: () async => await controller.goToReadingPage(
              book: book,
            ),
            book: book,
            enabled: !controller.quizes.any((element) =>
                element.bookName == book.title &&
                element.uuidChild == controller.child!.uuidChild),
          ),
        )
      ],
    );
  }
}
