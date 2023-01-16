import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/business_logic/signup_teacher_provider.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';
import '../../../../shared_module/shared_widgets/custom_button.dart';
import '../../../../shared_module/shared_widgets/custom_header_widget.dart';
import '../../../../shared_module/shared_widgets/custom_progress_indicator.dart';
import '../widgets/custom_container_widget.dart';

class SignUpTeacherCourseLevelScreen extends StatefulWidget {
  const SignUpTeacherCourseLevelScreen({Key? key}) : super(key: key);

  @override
  State<SignUpTeacherCourseLevelScreen> createState() =>
      _SignUpTeacherCourseLevelScreenState();
}

class _SignUpTeacherCourseLevelScreenState
    extends State<SignUpTeacherCourseLevelScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignUpTeacherProvider>(context, listen: false).getLevels();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SignUpTeacherProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomScreenHeader(
                    title: 'Sign up',
                    imageWidth: 375.w,
                    imageHeight: 200.h,
                    hasBackButton: true),
                SizedBox(
                  height: 10.h,
                ),
                provider.isLoading
                    ? const CustomProgressIndicator(color: AppColors.pinkColor)
                    : provider.subjects.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 7.w),
                                  child: Container(
                                    height: 44.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.r)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider.subjects[provider.subjectIndex]
                                            .name!,
                                        style: AppTextStyles.robotoMediumBlack,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Select level for the subject selected",
                                  style: AppTextStyles.robotoRegularBlack,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: provider.levels.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          provider.selectLevel(index);
                                        },
                                        child: CustomContainer(
                                            isSelected:
                                                provider.levelIndex == index,
                                            titleColor: AppColors.whiteColor,
                                            title: provider.levels[index].name!,
                                            color: AppColors.pinkColor),
                                      );
                                    }),
                                SizedBox(
                                  height: 50.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: CustomButton(
                                      buttonContent: provider.signUpLoading
                                          ? const CustomProgressIndicator(
                                              color: AppColors.whiteColor)
                                          : Text(
                                              'Create my account',
                                              style: provider.levelIndex != -1
                                                  ? AppTextStyles
                                                      .robotoMediumWhite
                                                  : AppTextStyles
                                                      .robotoMediumWhite
                                                      .copyWith(
                                                          color: AppColors
                                                              .blueColor),
                                            ),
                                      onPressed: provider.levelIndex != -1
                                          ? provider.signUpLoading
                                              ? () {}
                                              : () async {
                                                  bool registered =
                                                      await provider
                                                          .signupTeacher();
                                                  if (registered) {
                                                    RoutingProvider
                                                        .pushNamedAndRemoveAllBack(
                                                            routeName: Routes
                                                                .loginScreen);
                                                  }
                                                }
                                          : null),
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      // Todo move to the page...
                                    },
                                    child: Center(
                                        child: Text(
                                      "J'ai déjà un compte",
                                      style: AppTextStyles.robotoBoldBlack,
                                    ))),
                                SizedBox(
                                  height: 50.h,
                                ),
                              ],
                            ),
                          )
                        : Container(),
              ],
            ),
          );
        }),
      ),
    );
  }
  // ToDO remove this function only for test the active selection
/**
 * the series is 2 1 3  ship the first 2 item and select third then skip one and select the next then select
 *
 */
}
