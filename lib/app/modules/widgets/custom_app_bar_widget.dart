import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Function() action;
  const CustomAppBarWidget({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: action,
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      actions: [
        Lottie.asset(
          'lib/app/assets/bookLogo.json',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
