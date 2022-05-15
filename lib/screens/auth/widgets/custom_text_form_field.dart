import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackathon/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final int maxLines;
  final String? Function(String?)? validator;
  final String? hintText;
  final double width;
  final double height;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.hintText,
    this.maxLines = 1,
    this.isPassword = false,
    this.height = 50,
    this.width = 325,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, color: AppColors.black),
        ),
        SizedBox(height: 4),
        SizedBox(
          width: width.w,
          height: height.h,
          child: buildTextFormField(),
        ),
      ],
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      validator: validator ?? (String? val) => null,
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: AppColors.light_grey),
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: TextStyle(color: AppColors.sand),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.light_grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.sand,
            width: 1.0,
          ),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
    );
  }
}
