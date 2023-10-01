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
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              '41',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
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
          action: () {},
        ),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a ',
        softWrap: true,
        style: TextStyle(
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
            child: Obx(() => controller.showLoading.value
                ? LinearProgressIndicator(
                    backgroundColor: AppColors.primaryColor,
                  )
                : SizedBox(
                    height: 100.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.childList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
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
                        );
                      },
                    ),
                  )),
          ),
          SliverToBoxAdapter(
            child: titleSection,
          ),
          SliverToBoxAdapter(
            child: buttonSection,
          ),
          SliverToBoxAdapter(
            child: textSection,
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
