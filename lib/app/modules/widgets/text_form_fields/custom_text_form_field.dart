// ignore_for_file: prefer_initializing_formals, unnecessary_this

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class CustomTextFormField extends GetView {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final bool? isMoney;
  final bool? passwordVisible;
  final VoidCallback? onTapPasswordVisible;
  final TextEditingController? textEditingController;
  final bool textInputUsernameVisible;
  final bool textInputPasswordVisible;
  final bool? textInputEnable;
  final Color? fillColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? changeAccount;

  const CustomTextFormField(
      {Key? key,
      this.onChanged,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction,
      this.inputFormatters,
      required this.labelText,
      this.validator,
      this.keyboardType,
      this.textCapitalization,
      this.passwordVisible,
      this.onTapPasswordVisible,
      this.isMoney,
      this.textEditingController,
      required this.fillColor,
      required this.borderColor,
      required this.textInputEnable,
      required this.textInputUsernameVisible,
      required this.textInputPasswordVisible,
      required this.changeAccount})
      : super(key: key);

  const CustomTextFormField.email(
      {Key? key,
      this.onChanged,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction,
      this.inputFormatters,
      required this.labelText,
      this.validator,
      this.keyboardType,
      this.textCapitalization,
      this.passwordVisible,
      this.onTapPasswordVisible,
      this.isMoney,
      this.textEditingController,
      required this.fillColor,
      required this.borderColor,
      required this.textInputEnable,
      required this.textInputUsernameVisible,
      required this.textInputPasswordVisible,
      required this.changeAccount})
      : super(key: key);

  const CustomTextFormField.password(
      {Key? key,
      FocusNode? focusNode,
      TextInputAction? textInputAction,
      required textInputPasswordVisible,
      required textInputUsernameVisible,
      required Function(String)? onChanged,
      Function(String)? onFieldSubmitted,
      List<TextInputFormatter>? inputFormatters,
      required String labelText,
      required String? Function(String?)? validator,
      TextInputType? keyboardType,
      TextCapitalization? textCapitalization,
      required bool passwordVisible,
      required VoidCallback? onTapPasswordVisible,
      this.isMoney,
      this.textEditingController,
      required this.textInputEnable,
      required this.fillColor,
      required this.borderColor,
      required this.changeAccount})
      : this.onChanged = onChanged,
        this.onFieldSubmitted = onFieldSubmitted,
        this.focusNode = focusNode,
        this.textInputAction = textInputAction,
        this.inputFormatters = inputFormatters,
        this.labelText = labelText,
        this.validator = validator,
        this.keyboardType = keyboardType,
        this.textCapitalization = textCapitalization,
        this.passwordVisible = passwordVisible,
        this.onTapPasswordVisible = onTapPasswordVisible,
        this.textInputUsernameVisible = textInputUsernameVisible,
        this.textInputPasswordVisible = textInputPasswordVisible,
        super(key: key);

  const CustomTextFormField.money(
      {Key? key,
      Function(String)? onChanged,
      Function(String)? onFieldSubmitted,
      TextInputAction? textInputAction,
      FocusNode? focusNode,
      required List<TextInputFormatter>? inputFormatters,
      String? labelText,
      String? Function(String?)? validator,
      TextInputType? keyboardType,
      TextCapitalization? textCapitalization,
      bool? passwordVisible,
      VoidCallback? onTapPasswordVisible,
      this.textEditingController,
      required this.fillColor,
      required this.borderColor,
      required this.textInputUsernameVisible,
      required this.textInputPasswordVisible,
      required this.textInputEnable,
      required this.changeAccount})
      : this.onChanged = onChanged,
        this.onFieldSubmitted = onFieldSubmitted,
        this.focusNode = focusNode,
        this.textInputAction = textInputAction,
        this.inputFormatters = inputFormatters,
        this.labelText = labelText ?? "",
        this.validator = validator,
        this.keyboardType = keyboardType,
        this.textCapitalization = textCapitalization,
        this.passwordVisible = passwordVisible,
        this.onTapPasswordVisible = onTapPasswordVisible,
        this.isMoney = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      textAlign: isMoney == null ? TextAlign.left : TextAlign.right,
      enabled: textInputEnable,
      controller: textEditingController,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      cursorColor: AppColors.green,
      style: isMoney == null
          ? TextStyle(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400)
          : TextStyle(
              color: AppColors.green,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          fillColor: fillColor,
          filled: true,
          labelText: isMoney == null ? labelText : null,
          alignLabelWithHint: true,
          hintText: isMoney == null ? null : labelText,
          hintStyle: isMoney == null
              ? null
              : TextStyle(
                  color: AppColors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
          labelStyle: isMoney == null
              ? TextStyle(
                  color: AppColors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400)
              : TextStyle(
                  color: AppColors.green,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: textInputPasswordVisible || textInputUsernameVisible
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 1.0,
                  ),
                )
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: AppColors.mediumGray,
                    width: 1.0,
                  ),
                ),
          enabledBorder: textInputPasswordVisible || textInputUsernameVisible
              ? OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.red,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor!, //Color(0xffE2E1E2),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: isMoney != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: const Text("\$",
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.w600)),
                )
              : null,
          suffixIcon: onTapPasswordVisible != null
              ? GestureDetector(
                  child: Icon(
                    passwordVisible == false
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.mediumGray,
                  ),
                  onTap: () {
                    onTapPasswordVisible!();
                  },
                )
              : null),
      obscureText: passwordVisible ?? false,
      validator: validator,
    );
  }
}
