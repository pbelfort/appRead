import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../theme/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => controller.showCustomDialog(
        context: context,
        message: 'Deseja realmente sair do aplicativo',
        yesFunction: () => Navigator.of(context).pop(true),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: controller.goToAdminPage,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.admin_panel_settings,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.backgroundColor,
              pinned: true,
              expandedHeight: 360.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Oba! Vamos ler um pouquinho?'),
                background: Center(
                  child: Lottie.asset(
                    'lib/app/assets/bookLogo.json',
                    width: 200,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => controller.showLoading.value
                    ? const LinearProgressIndicator(
                        backgroundColor: AppColors.primaryColor,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SizedBox(
                          height: 350.0,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.childList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => controller.goToUserBookPage(
                                  controller.childList[index],
                                ),
                                child: Card(
                                  color: AppColors.primaryColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 22.0),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    AppColors.white,
                                                child: Icon(
                                                  Icons.child_care,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 10,
                                              ),
                                              child: Text(
                                                controller
                                                    .childList[index].childName,
                                                style: const TextStyle(
                                                  color: AppColors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
