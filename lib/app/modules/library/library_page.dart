import 'package:app_read/app/modules/library/widgets/library_list_widget.dart';
import 'package:app_read/app/modules/user_book/user_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/text_form_fields/custom_text_form_field.dart';

class LibraryPage extends GetView<UserBookController> {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBarWidget(),
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
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
                labelText: 'Pesquise pelo título do livro',
                validator: (value) {
                  return null;
                },
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
              const Expanded(
                child: LibraryItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
