import 'package:app_read/app/modules/admin/admin_controller.dart';
import 'package:app_read/app/theme/app_colors.dart';
import 'package:app_read/app/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends GetView<AdminController> {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Aproveitamento',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Text(
                  'Acompanhe a evolução das crianças',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Obx(() => controller.showLoading.value
              ? const SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '${controller.totalChildScore}%',
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                )),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
          icon: Icons.add,
          label: 'ADICIONAR',
          action: () {
            controller.goToChildFormFillPage();
          },
        ),
        _buildButtonColumn(
          icon: Icons.person_2_rounded,
          label: 'DADOS PESSOAIS',
          action: () {},
        ),
        _buildButtonColumn(
          icon: Icons.logout_outlined,
          label: 'SAIR',
          action: () => controller.showCustomDialog(
              context: context,
              message: 'Deseja realmente sair?',
              yesFunction: () {}),
        ),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        controller.evolutionText(),
        softWrap: true,
        style: const TextStyle(
          color: AppColors.white,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColorWithAlpha,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: AppColors.backgroundColor,
            pinned: true,
            expandedHeight: 360.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Painel de Administrador'),
              background: Icon(
                Icons.admin_panel_settings,
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
                          return SizedBox(
                            width: 140.0,
                            child: Card(
                              color: AppColors.primaryColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            top: 12.0,
                                            left: 4,
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: AppColors.white,
                                            child: Icon(
                                              Icons.child_care,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 12.0,
                                            left: 4,
                                          ),
                                          child: Text(
                                            controller
                                                .childList[index].childName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () =>
                                          controller.showCustomDialog(
                                            context: context,
                                            message:
                                                'Deseja deletar este usuário?',
                                            yesFunction: () {
                                              controller.deleteChild(controller
                                                  .childList[index].uuidChild);
                                            },
                                          ),
                                      icon: const Icon(
                                        Icons.delete,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: titleSection,
          ),
          SliverToBoxAdapter(
            child: textSection,
          ),
          SliverToBoxAdapter(
            child: buttonSection,
          ),
        ],
      ),
    );
  }
}

Column _buildButtonColumn({
  required IconData icon,
  required String label,
  required Function() action,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        onTap: action,
        child: Icon(
          icon,
          color: AppColors.white,
          size: 60,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: AppTextStyles.textBold14,
        ),
      ),
    ],
  );
}
