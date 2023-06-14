import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class CustomButtonStyle {
  static final styleGreen = CustomButtonStyle(
    backgroundColor: AppColors.primaryColor,
    titleColor: AppColors.white,
    fontSize: 12.sp,
  );

  static final styleGreenRounded = CustomButtonStyle(
    backgroundColor: AppColors.primaryColor,
    titleColor: AppColors.backgroundColor,
    fontSize: 14.sp,
  );

  static final styleDarkGreen = CustomButtonStyle(
    backgroundColor: AppColors.primaryColor,
    titleColor: AppColors.white,
    fontSize: 12.sp,
  );

  static final styleCardGreen = CustomButtonStyle(
    backgroundColor: AppColors.primaryColor,
    titleColor: AppColors.white,
    fontSize: 16.sp,
  );

  static final styleDarkGray = CustomButtonStyle(
    backgroundColor: AppColors.darkGray,
    titleColor: AppColors.white,
    fontSize: 12.sp,
  );

  static final styleMediumGray = CustomButtonStyle(
    backgroundColor: AppColors.mediumGray,
    titleColor: AppColors.darkGray,
    fontSize: 12.sp,
  );

  static final styleDarkRed = CustomButtonStyle(
    backgroundColor: AppColors.red,
    titleColor: AppColors.white,
    fontSize: 12.sp,
  );

  static final styleWhitePurple = CustomButtonStyle(
    backgroundColor: AppColors.white,
    titleColor: AppColors.purple,
    fontSize: 12.sp,
  );

  static final styleOutlineGray = CustomButtonStyle(
    backgroundColor: AppColors.lightGray,
    titleColor: AppColors.darkGray,
    fontSize: 12.sp,
    borderColor: AppColors.mediumGray,
  );

  static final styleOutlineWhite = CustomButtonStyle(
    backgroundColor: AppColors.white,
    titleColor: AppColors.darkGray,
    fontSize: 12.sp,
    borderColor: AppColors.darkGray,
  );

  static final styleOutlineDarkGreen = CustomButtonStyle(
    backgroundColor: AppColors.white,
    titleColor: AppColors.primaryColor,
    fontSize: 12.sp,
    borderColor: AppColors.primaryColor,
  );

  final Color backgroundColor;
  final Color titleColor;
  final double fontSize;
  final Color borderColor;

  CustomButtonStyle({
    required this.backgroundColor,
    required this.titleColor,
    required this.fontSize,
    this.borderColor = Colors.white,
  });
}

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final CustomButtonStyle style;
  final EdgeInsets margin;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final bool border;
  final double? borderRadius;
  final bool disabled;
  final bool hasIcon;
  final IconData? iconData;
  final Color? iconColor;
  final String? iconSvg;
  final FocusNode? focusNode;

  const CustomButtonWidget({
    Key? key,
    required this.title,
    required this.style,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.border = false,
    this.borderRadius,
    this.disabled = false,
    this.hasIcon = false,
    this.iconSvg = "",
    this.iconColor,
    this.iconData,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      margin: margin,
      width: width,
      child: TextButton(
        focusNode: focusNode,
        onPressed: disabled ? null : onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: disabled
              ? style.backgroundColor.withOpacity(0.5)
              : style.backgroundColor,
          shape: border
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                  side: BorderSide(
                    color: style.borderColor,
                    width: 1,
                  ),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 20),
                ),
        ),
        child: hasIcon
            ? Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: style.fontSize,
                    fontWeight: FontWeight.w600,
                    color: disabled ? style.titleColor : style.titleColor,
                  ),
                ),
              )
            : Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: style.fontSize,
                  fontWeight: FontWeight.bold,
                  color: disabled ? style.titleColor : style.titleColor,
                ),
              ),
      ),
    );
  }
}
