import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/enums/user_type.dart';
import 'package:trop_prof_itfaq/constants/images/images.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_button.dart';
import 'package:trop_prof_itfaq/modules/shared_module/signup_screen/business_logic/signup_provider.dart';
import 'package:trop_prof_itfaq/modules/shared_module/signup_screen/presentation/widgets/user_type_card.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

// sign up screen design
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image of the page
          Image.asset(
            AppImages.signUpBackground,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  const BackButton(
                    color: AppColors.whiteColor,
                  ),
                  Consumer<SignUpProvider>(builder: (context, provider, _) {
                    UserType? userType = provider.userType;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Center(
                          child: Text(
                            'Sign up as',
                            style: AppTextStyles.robotoMediumWhite
                                .copyWith(fontSize: 24.sp),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Text(
                            'Choose selection below',
                            style: AppTextStyles.robotoRegularWhite,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        UserTypeCard(
                            title: 'Etuident',
                            imagePath: AppImages.signUpStudentBackground,
                            value: 0,
                            groupValue: userType != null
                                ? UserType.values.indexOf(userType)
                                : -1,
                            onSelected: (value) {
                              provider.changeUserType(UserType.student);
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                        UserTypeCard(
                            title: 'Parent',
                            imagePath: AppImages.signUpParentBackground,
                            value: 1,
                            groupValue: userType != null
                                ? UserType.values.indexOf(userType)
                                : -1,
                            onSelected: (value) {
                              provider.changeUserType(UserType.parent);
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                        UserTypeCard(
                            title: 'Professur',
                            imagePath: AppImages.signUpTeacherBackground,
                            value: 2,
                            groupValue: userType != null
                                ? UserType.values.indexOf(userType)
                                : -1,
                            onSelected: (value) {
                              provider.changeUserType(UserType.teacher);
                            }),
                        SizedBox(
                          height: 80.h,
                        ),
                        SizedBox(
                            width: 300.w,
                            child: CustomButton(
                                buttonContent: Text(
                                  'Inscription',
                                  style: userType != null
                                      ? AppTextStyles.robotoMediumWhite
                                      : AppTextStyles.robotoMediumWhite
                                          .copyWith(color: AppColors.blueColor),
                                ),
                                onPressed: userType != null
                                    ? () {
                                        switch (userType) {
                                          case UserType.parent:
                                            RoutingProvider.pushNamed(
                                                routeName:
                                                    Routes.signUpParentScreen);
                                            break;
                                          case UserType.student:
                                            RoutingProvider.pushNamed(
                                                routeName: Routes
                                                    .studentAgeVerificationScreen);
                                            break;
                                          case UserType.teacher:
                                            RoutingProvider.pushNamed(
                                                routeName: Routes
                                                    .signUpTeacherScreen);
                                            break;
                                          default:
                                        }
                                      }
                                    : null)),
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'J\'ai déjà un compte',
                              style: AppTextStyles.robotoMediumBlue
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
