import '../colors/colors.dart';
import '../fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// These class to define the styles in app for text
class AppTextStyles {
  // Inter Font TextStyle
  static TextStyle robotoBoldWhite = TextStyle(
      fontSize: 16.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.bold);
  static TextStyle robotoRegularWhite = TextStyle(
      fontSize: 14.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.normal);

  static TextStyle robotoRegularBlack = TextStyle(
      fontSize: 14.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.normal);
  static TextStyle robotoRegularBlue = TextStyle(
      fontSize: 14.sp,
      color: AppColors.blueColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.normal);
  static TextStyle robotoBoldBlack = TextStyle(
      fontSize: 14.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.bold);
  static TextStyle robotoMediumWhite = TextStyle(
      fontSize: 14.sp,
      color: AppColors.whiteColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoMediumBlue = TextStyle(
      fontSize: 14.sp,
      color: AppColors.blueColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoMediumBlack = TextStyle(
      fontSize: 16.sp,
      color: AppColors.blackColor,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.w500);
  static TextStyle robotoRegularGrey55 = TextStyle(
      fontSize: 14.sp,
      color: AppColors.grey55Color,
      fontFamily: AppFonts.robotoFamily,
      fontWeight: FontWeight.normal);
}
