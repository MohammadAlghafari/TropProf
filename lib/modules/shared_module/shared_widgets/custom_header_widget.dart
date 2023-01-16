import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';

class CustomScreenHeader extends StatelessWidget {
  const CustomScreenHeader({
    Key? key,
    required this.title,
    required this.imageWidth,
    required this.imageHeight,
    this.hasBackButton = false,
  }) : super(key: key);

  final String title;
  final double imageWidth;
  final double imageHeight;
  final bool hasBackButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: imageWidth,
          height: imageHeight,
        ),
        Positioned(
          top: 0.h,
          width: imageWidth,
          height: imageHeight,
          child: Image.asset(
            AppIcons.headerIcon,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Text(
              title,
              style: AppTextStyles.robotoBoldBlack.copyWith(fontSize: 24.sp),
            )),
        // Container(
        //   // width: double.infinity,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       SizedBox(
        //         height: 60.h,
        //       ),
        //
        //       SizedBox(
        //         height: 78.h,
        //       ),
        //       Text(
        //         title,
        //         // style: AppTextStyles.header1Inter,
        //       ),
        //       SizedBox(
        //         height: 35.h,
        //       ),
        //     ],
        //   ),
        // ),
        if (hasBackButton)
          Positioned(
            top: 50.h,
            left: 20.w,
            child: const BackButton(
              color: AppColors.whiteColor,
            ),
          ),
      ],
    );
  }
}
