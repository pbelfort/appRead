import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';
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
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              // ...controller.bookList.map(
              //   (book) => CustomCardWidget(
              //     action: () async => await controller.goToReadingPage(
              //       title: book.title ?? '',
              //       description: book.description ?? '',
              //     ),
              //     book: book,
              //     icon: Icons.abc,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
