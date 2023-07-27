import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';
import '../../widgets/buttons/label_button.dart';
import '../user_book_controller.dart';

class BodyWidget extends GetView<UserBookController> {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                LabelButton(
                  'Biblioteca',
                  Icons.library_books_outlined,
                  onPressed: () => controller.goToLibraryPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
