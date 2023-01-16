import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_progress_indicator.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/business_logic/signup_teacher_provider.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

import '../../../../shared_module/shared_widgets/custom_button.dart';
import '../../../../shared_module/shared_widgets/custom_header_widget.dart';

class SignUpTeacherSubjectsScreen extends StatefulWidget {
  const SignUpTeacherSubjectsScreen({Key? key}) : super(key: key);

  @override
  State<SignUpTeacherSubjectsScreen> createState() =>
      _SignUpTeacherSubjectsScreenState();
}

class _SignUpTeacherSubjectsScreenState
    extends State<SignUpTeacherSubjectsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignUpTeacherProvider>(context, listen: false).getSubjects();
    });
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SignUpTeacherProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Center(
                      child: Text(
                    "Select the first subject that you taught",
                    style: AppTextStyles.robotoRegularGrey55,
                  )),
                  SizedBox(
                    height: 62.h,
                  ),
                  provider.isLoading
                      ? const CustomProgressIndicator(
                          color: AppColors.pinkColor)
                      : provider.subjects.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 34.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subjects Taught",
                                    style: AppTextStyles.robotoRegularBlack,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  Wrap(
                                    spacing: 10.w,
                                    runSpacing: 10.h,
                                    children: List.generate(
                                      provider.subjects.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          provider.changeSubject(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 15.h),
                                          decoration: BoxDecoration(
                                              color:
                                                  provider.subjectIndex == index
                                                      ? AppColors.pinkColor
                                                      : AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Text(
                                            provider.subjects[index].name!,
                                            textAlign: TextAlign.center,
                                            style:
                                                provider.subjectIndex == index
                                                    ? AppTextStyles
                                                        .robotoMediumWhite
                                                    : AppTextStyles
                                                        .robotoMediumBlue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  /* const SizedBox(
                            width: double.infinity, child: CustomBadgeWidget()), */
                                  SizedBox(
                                    height: 137.h,
                                  ),
                                  CustomButton(
                                      buttonContent: Text(
                                        'Continue',
                                        style: provider.subjectIndex != -1
                                            ? AppTextStyles.robotoMediumWhite
                                            : AppTextStyles.robotoMediumWhite
                                                .copyWith(
                                                    color: AppColors.blueColor),
                                      ),
                                      onPressed: provider.subjectIndex != -1
                                          ? () {
                                              RoutingProvider.pushNamed(
                                                  routeName: Routes
                                                      .signUpTeacherLevelsScreen);
                                            }
                                          : null),
                                  SizedBox(
                                    height: 102.h,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        // Todo move to the page...
                                      },
                                      child: Center(
                                          child: Text(
                                        "J'ai déjà un compte",
                                        style: AppTextStyles.robotoBoldBlack,
                                      )))
                                ],
                              ),
                            )
                          : Container(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
