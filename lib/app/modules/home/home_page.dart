import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: controller.goToAdminPage,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.admin_panel_settings)),
      backgroundColor: AppColors.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: AppColors.backgroundColor,
            pinned: true,
            expandedHeight: 360.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Oba! Vamos ler um pouco?'),
              background: Icon(
                Icons.menu_book_rounded,
                size: 200,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(
              () => controller.showLoading.value
                  ? const LinearProgressIndicator(
                      backgroundColor: AppColors.primaryColor,
                    )
                  : SizedBox(
                      height: 100.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.childList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => controller.goToUserBookPage(
                              controller.childList[index],
                            ),
                            child: SizedBox(
                              width: 100.0,
                              child: Card(
                                color: AppColors.primaryColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircleAvatar(
                                        backgroundColor: AppColors.white,
                                        child: Icon(
                                          Icons.child_care,
                                          color: AppColors.primaryColor,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        controller.childList[index].childName,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
