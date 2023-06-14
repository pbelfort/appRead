import 'package:app_read/app/modules/home/widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Lottie.asset(
                'lib/app/assets/bookLogo.json',
                width: 100,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              'Oba! Vamos ler um pouco?',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeCardWidget(
                  cardFunctionCalback: () => print('mas'),
                  cardWidgetIcon: Icons.person,
                  cardTitle: 'Pedro',
                ),
                HomeCardWidget(
                  cardFunctionCalback: () => print('mes'),
                  cardWidgetIcon: Icons.admin_panel_settings,
                  cardTitle: 'Admin',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
