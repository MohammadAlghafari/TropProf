import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/circle_image_with_border.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_button.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_text_field_widget.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

import '../../../../../constants/images/images.dart';
import '../../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_module/shared_widgets/circle_container_with_name.dart';
import '../../../../shared_module/shared_widgets/custom_badge_edit.dart';

class TeacherProfileFirstScreen extends StatelessWidget {
  const TeacherProfileFirstScreen({super.key, required this.teacherInfo});

  final TeacherProfileResponseModel teacherInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            AppImages.profileDecoration,
          ),
          Container(
            padding: EdgeInsets.only(top: 85.h, right: 35.w, left: 35.w),
            margin: EdgeInsets.only(top: 150.h),
            decoration: BoxDecoration(
                color: AppColors.lightPinkColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: ListView(
              children: [
                Text(
                  'First name',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'First name',
                  initialText: teacherInfo.generalInformation!.firstName,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Last name',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Last name',
                  initialText: teacherInfo.generalInformation!.lastName,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Gender',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.transparentColor,
                        isScrollControlled: true,
                        builder: (context) => Wrap(children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r),
                                        topRight: Radius.circular(10.r))),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      'Male',
                                      style: AppTextStyles.robotoRegularBlack
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      'Female',
                                      style: AppTextStyles.robotoRegularBlack
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      'I Won\'t tell',
                                      style: AppTextStyles.robotoRegularBlack
                                          .copyWith(fontSize: 16.sp),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                  ],
                                ),
                              )
                            ]));
                  },
                  borderColor: AppColors.grey15Color,
                  hint: 'Gender',
                  enableField: false,
                  suffix: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.grey55Color,
                  ),
                  initialText: teacherInfo.generalInformation!.gender,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Email address',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Email address',
                  initialText: teacherInfo.generalInformation!.email,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Phone number',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Phone number',
                  initialText: teacherInfo.generalInformation!.phoneNumber,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Date of birth',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Date of birth',
                  initialText: teacherInfo.generalInformation!.dateOfBirth,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Headline',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Headline',
                  initialText: teacherInfo.aboutMe!.aboutMeHeadline,
                  minLines: 3,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Bio',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Bio',
                  initialText: teacherInfo.aboutMe!.aboutMeBio,
                  minLines: 10,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Address',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Street',
                  initialText: teacherInfo.address!.streetName,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Additional line',
                  initialText: teacherInfo.address!.additionalLine,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'ZIP Code',
                  initialText: teacherInfo.address!.zipCode,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'City',
                  initialText: teacherInfo.address!.city,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  borderColor: AppColors.grey15Color,
                  hint: 'Country',
                  initialText: teacherInfo.address!.country,
                  hintStyle: AppTextStyles.robotoRegularGrey55
                      .copyWith(color: AppColors.grey40Color),
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                    buttonContent: Text(
                      'Next',
                      style: AppTextStyles.robotoMediumWhite,
                    ),
                    onPressed: () {
                      RoutingProvider.pushNamed(
                          routeName: Routes.teacherProfileSecondScreen,
                          arguments: teacherInfo);
                    }),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 70.h,
            start: 20.w,
            child: const BackButton(
              color: AppColors.whiteColor,
            ),
          ),
          /* PositionedDirectional(
            top: 70.h,
            end: 20.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                )),
                elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                  return 0.0;
                }),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return AppColors.whiteColor.withOpacity(0.2);
                  },
                ),
                minimumSize: MaterialStateProperty.resolveWith<Size>(
                    (Set<MaterialState> states) {
                  return Size(50.w, 35.h);
                }),
              ),
              child: Text(
                'Save',
                style: AppTextStyles.robotoMediumWhite,
              ),
            ),
          ), */
          Positioned(
            top: 100.h,
            child: Stack(
              children: [
                teacherInfo.photoUrl != null && teacherInfo.photoUrl!.isNotEmpty
                    ? CircleImageWithBorder(
                        url: teacherInfo.photoUrl!, width: 95.r, height: 95.r)
                    : CircleContainerWithName(
                        name: teacherInfo.generalInformation!.firstName!,
                        width: 95.r,
                        height: 95.r,
                        borderColor: AppColors.pinkColor,
                        borderWidth: 3.r,
                        fontSize: 20,
                      ),
                /* CircleImageWithBorder(
                url: 'https://freepngimg.com/thumb/man/10-man-png-image.png',
                width: 60.h,
                height: 60.h,
                borderColor: AppColors.greenColor,
                borderWidth: 3.r,
              ), */
                Positioned(
                    bottom: 0.h,
                    right: 0.w,
                    child: CustomBadgeEdit(
                      onPress: () {},
                    )),
              ],
            ),
          ),
          Positioned(
            top: 210.h,
            child: Text(
              'My Profile',
              style: AppTextStyles.robotoMediumWhite
                  .copyWith(fontSize: 16.sp, color: AppColors.pinkColor),
            ),
          )
        ],
      ),
    );
  }
}
