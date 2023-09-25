import 'package:app_read/app/modules/library/library_controller.dart';
import 'package:app_read/app/modules/library/widgets/library_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../theme/app_colors.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/text_form_fields/custom_text_form_field.dart';

class LibraryPage extends GetView<LibraryController> {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 1.0,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                changeAccount: true,
                borderColor: AppColors.backgroundColor,
                fillColor: AppColors.white,
                textInputEnable: true,
                textInputUsernameVisible: true,
                textInputPasswordVisible: false,
                onChanged: (value) {
                  controller.filterSearchResults(value);
                },
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                labelText: 'Pesquise pelo título do livro',
                textEditingController: controller.searchEditingController,
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Biblioteca de livros',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(right: 35.0),
                        child: Icon(
                          Icons.update,
                          size: 24,
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 10.0,
                      top: 10.0,
                    ),
                    child: Divider(
                      color: AppColors.white,
                      thickness: 2,
                      endIndent: 8,
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  if (controller.showLoading.value) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Lottie.asset(
                          'lib/app/assets/bookLogo.json',
                          width: 150,
                        ),
                      ),
                    );
                  }
                  return const Expanded(
                    child: LibraryItems(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
