import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  final String title;
  final Color titleColor;
  final bool isSelected;
  const CustomContainer(
      {Key? key,
      required this.title,
      required this.color,
      required this.titleColor,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.w),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          border: !isSelected ? Border.all(color: AppColors.grey15Color) : null,
          color: _getColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Center(
          child: Text(
            title,
            style: _getTitleTextStyle,
          ),
        ),
      ),
    );
  }

  // Get the color of container [isSelected : true => pink color otherwise white color]
  Color get _getColor =>
      isSelected ? AppColors.pinkColor : AppColors.transparentColor;
  // GET the style of the title [isSelected : true => pink color otherwise white color]
  TextStyle get _getTitleTextStyle => AppTextStyles.robotoMediumBlack.copyWith(
      color: isSelected ? AppColors.whiteColor : AppColors.blackColor);
}
