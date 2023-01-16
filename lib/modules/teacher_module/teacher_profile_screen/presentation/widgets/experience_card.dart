import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';

import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/text_styles/text_styles.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({Key? key, required this.experinceModel})
      : super(key: key);

  final ExperinceModel experinceModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
          //border: Border.all(color: AppColors.grey15Color),
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                experinceModel.title!,
                style:
                    AppTextStyles.robotoMediumBlack.copyWith(fontSize: 12.sp),
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
          SizedBox(
            height: 8.h,
          ),
          Text(
            '${DateTime.parse(experinceModel.startYear!).year} - ${DateTime.parse(experinceModel.endYear!).year}',
            style: AppTextStyles.robotoMediumBlack
                .copyWith(fontSize: 12.sp, color: AppColors.grey30Color),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            experinceModel.description!,
            style: AppTextStyles.robotoRegularBlack.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
