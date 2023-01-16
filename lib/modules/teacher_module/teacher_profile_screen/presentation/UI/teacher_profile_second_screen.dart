import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_profile_screen/presentation/widgets/document_card.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_profile_screen/presentation/widgets/subject_card.dart';

import '../../../../../constants/images/images.dart';
import '../../../../../constants/text_styles/text_styles.dart';
import '../../../../shared_module/shared_widgets/circle_container_with_name.dart';
import '../../../../shared_module/shared_widgets/circle_image_with_border.dart';
import '../../../../shared_module/shared_widgets/custom_badge_edit.dart';
import '../../../../shared_module/shared_widgets/custom_button.dart';
import '../../../teacher_home_screen/data/model/teacher_profile_response_model.dart';
import '../widgets/experience_card.dart';

class TeacherProfileSecondScreen extends StatelessWidget {
  const TeacherProfileSecondScreen({super.key, required this.teacherInfo});

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
                  'Experiences',
                  style: AppTextStyles.robotoMediumBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                if (teacherInfo.experiences != null)
                  ...List.generate(
                    teacherInfo.experiences!.length,
                    (index) => Column(
                      children: [
                        ExperienceCard(
                            experinceModel: teacherInfo.experiences![index]),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  )
                else
                  const Center(child: Text('No Experiences Found')),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Add more experience',
                      style: AppTextStyles.robotoBoldBlack
                          .copyWith(color: AppColors.blueColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Subjects taught',
                  style: AppTextStyles.robotoMediumBlack,
                ),
                SizedBox(
                  height: 12.h,
                ),
                if (teacherInfo.courses != null)
                  ...List.generate(
                    teacherInfo.courses!.length,
                    (index) => Column(
                      children: [
                        SubjectCard(courseModel: teacherInfo.courses![index]),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  )
                else
                  const Center(child: Text('No Subjects Found')),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Add more subjects',
                      style: AppTextStyles.robotoBoldBlack
                          .copyWith(color: AppColors.blueColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'My documents',
                  style: AppTextStyles.robotoMediumBlack,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Text(
                      'Documents',
                      style: AppTextStyles.robotoMediumBlack,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.upload_file,
                      color: AppColors.blueColor,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Upload',
                      style: AppTextStyles.robotoRegularBlue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                if (teacherInfo.documents != null &&
                    teacherInfo.documents!
                        .where((element) => element.type != 'Identification')
                        .isNotEmpty)
                  ...List.generate(
                    teacherInfo.documents!
                        .where((element) => element.type != 'Identification')
                        .length,
                    (index) => Column(
                      children: [
                        DocumentCard(
                          fileModel: teacherInfo.documents!
                              .where(
                                  (element) => element.type != 'Identification')
                              .toList()[index],
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  )
                else
                  const Center(child: Text('No Documents Found')),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      'Identification',
                      style: AppTextStyles.robotoMediumBlack,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.upload_file,
                      color: AppColors.blueColor,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Upload',
                      style: AppTextStyles.robotoRegularBlue,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                if (teacherInfo.documents != null &&
                    teacherInfo.documents!
                        .where((element) => element.type == 'Identification')
                        .isNotEmpty)
                  ...List.generate(
                    teacherInfo.documents!
                        .where((element) => element.type == 'Identification')
                        .length,
                    (index) => Column(
                      children: [
                        DocumentCard(
                          fileModel: teacherInfo.documents!
                              .where(
                                  (element) => element.type == 'Identification')
                              .toList()[index],
                        ),
                        SizedBox(
                          height: 15.h,
                        )
                      ],
                    ),
                  )
                else
                  const Center(child: Text('No Documents Found')),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                    buttonContent: Text(
                      'Preview my profile',
                      style: AppTextStyles.robotoMediumWhite,
                    ),
                    onPressed: () {}),
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
