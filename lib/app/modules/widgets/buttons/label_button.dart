import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function()? onPressed;
  final String? tag;

  const LabelButton(this.label, this.icon,
      {Key? key, required this.onPressed, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  fixedSize: const Size(60, 60),
                  elevation: 2,
                ),
                child: Icon(
                  icon,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
              if (tag != null)
                Positioned(
                  bottom: 0,
                  right: 18,
                  left: 18,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    child: Text(
                      tag!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
          ),
        ],
      ),
    );
  }
}
