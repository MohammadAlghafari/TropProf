import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/course_model.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseModel.subject!.name!,
                style:
                    AppTextStyles.robotoMediumBlack.copyWith(fontSize: 12.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                courseModel.level!.name!,
                style: AppTextStyles.robotoMediumBlack
                    .copyWith(fontSize: 12.sp, color: AppColors.grey70Color),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.edit_outlined,
              size: 20.r,
              color: AppColors.blueColor.withAlpha(150),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.delete_outline,
              size: 20.r,
              color: AppColors.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
