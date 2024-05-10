import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/my_colors.dart';

class AuthTextFormField extends StatelessWidget {
  final String? fieldTitle;
  final TextStyle? fieldTitleStyle;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Widget? suffixIcon;
  final bool obscureText;

  const AuthTextFormField(
      {this.fieldTitle,
      this.fieldTitleStyle,
      this.hintText,
      this.controller,
      this.validator,
      this.labelText,
      this.suffixIcon,
      this.obscureText = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          fieldTitle ?? "",
          style: fieldTitleStyle ?? Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 20.h,
        ),
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: MyColors.primaryColor, fontSize: 14),
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            filled: true,
            fillColor: MyColors.whiteColor,
            errorMaxLines: 3,
            suffixIcon: suffixIcon,
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              // borderSide: BorderSide(color: MyTheme.primaryColor, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              // borderSide: BorderSide(color: MyTheme.primaryColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              // borderSide: BorderSide(color: MyTheme.redColor, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              // borderSide: BorderSide(color: MyTheme.redColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
