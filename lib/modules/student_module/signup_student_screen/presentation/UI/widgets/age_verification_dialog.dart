import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/icons/icons.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_button.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

class AgeVerificationDialog extends StatelessWidget {
  const AgeVerificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      backgroundColor: AppColors.pinkColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      child: SizedBox(
        height: 500.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 45.h,
              ),
              SvgPicture.asset(
                AppIcons.age18Icon,
                width: 95.r,
                height: 95.r,
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Please create parent account',
                style:
                    AppTextStyles.robotoMediumWhite.copyWith(fontSize: 20.sp),
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'To access to Trop Prof as a student you must be 18 or older.',
                  style: AppTextStyles.robotoRegularWhite,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              CustomButton(
                  buttonContent: Text(
                    'Go to parent\'s account',
                    style: AppTextStyles.robotoRegularWhite,
                  ),
                  color: AppColors.lightPinkColor.withOpacity(0.5),
                  onPressed: () {}),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                  buttonContent:
                      Text('Cancel', style: AppTextStyles.robotoRegularWhite),
                  color: AppColors.darkPinkColor,
                  onPressed: () {
                    RoutingProvider.goBack();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
