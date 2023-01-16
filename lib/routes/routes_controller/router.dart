import 'package:trop_prof_itfaq/modules/shared_module/forget_password/presentaion/UI/forget_password_email_screen.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/presentaion/UI/otp_verification_screen.dart';
import 'package:trop_prof_itfaq/modules/shared_module/forget_password/presentaion/UI/reset_password_screen.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/presentation/UI/login_screen.dart';
import 'package:trop_prof_itfaq/modules/shared_module/signup_screen/presentation/UI/signup_screen.dart';
import 'package:trop_prof_itfaq/modules/student_module/signup_student_screen/presentation/UI/student_age_verification_screen.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/presentation/UI/signup_teacher_course_level_screen.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/signup_teacher_screen/presentation/UI/signup_teacher_screen.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/presentation/UI/teacher_home_screen.dart';

import '../../modules/parent_module/signup_parent_screen.dart/presentation/UI/signup_parent_screen.dart';
import '../../modules/student_module/signup_student_screen/presentation/UI/signup_student_screen.dart';
import '../../modules/student_module/student_home_screen/presentation/UI/student_home_screen.dart';
import '../../modules/student_module/student_profile_screen/persentation/UI/student_profile_screen.dart';
import '../../modules/teacher_module/signup_teacher_screen/presentation/UI/signup_teacher_subjects_screen.dart';
import '../../modules/teacher_module/teacher_profile_screen/presentation/UI/teacher_profile_first_screen.dart';
import '../../modules/teacher_module/teacher_profile_screen/presentation/UI/teacher_profile_second_screen.dart';
import '../routes_names/routes_names.dart';
import 'package:flutter/material.dart';

/// This Function to route manger to all screen ( handle all routing screen)
/// if you need to add a new screen should be add it here in this file.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.base:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case Routes.forgetPasswordScreen:
      return MaterialPageRoute(
          builder: (_) => const ForgetPasswordEmailScreen());
    case Routes.otpVerificationScreen:
      return MaterialPageRoute(builder: (_) => const OtpVerificationScreen());
    case Routes.resetPasswordScreen:
      return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
    case Routes.signUpScreen:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case Routes.signUpParentScreen:
      return MaterialPageRoute(builder: (_) => const SignUpParentScreen());
    case Routes.signUpStudentScreen:
      return MaterialPageRoute(builder: (_) => const SignUpStudentScreen());
    case Routes.studentAgeVerificationScreen:
      return MaterialPageRoute(
          builder: (_) => const StudentAgeVerificationScreen());
    case Routes.signUpTeacherScreen:
      return MaterialPageRoute(builder: (_) => const SignUpTeacherScreen());
    case Routes.signUpTeacherSubjectsScreen:
      return MaterialPageRoute(
          builder: (_) => const SignUpTeacherSubjectsScreen());
    case Routes.signUpTeacherLevelsScreen:
      return MaterialPageRoute(
          builder: (_) => const SignUpTeacherCourseLevelScreen());
    case Routes.teacherHomeScreen:
      return MaterialPageRoute(builder: (_) => const TeacherHomeScreen());
    case Routes.studentHomeScreen:
      return MaterialPageRoute(builder: (_) => const StudentHomeScreen());
    case Routes.studentProfileScreen:
      return MaterialPageRoute(
          builder: (_) => StudentProfileScreen());
    case Routes.teacherProfileFirstScreen:
      return MaterialPageRoute(
          builder: (_) => TeacherProfileFirstScreen(teacherInfo:  settings.arguments as TeacherProfileResponseModel,));
    case Routes.teacherProfileSecondScreen:
      return MaterialPageRoute(
          builder: (_) => TeacherProfileSecondScreen(teacherInfo:  settings.arguments as TeacherProfileResponseModel,));
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                  body: Center(
                child: Text("Page Not Found"),
              )),
          settings: settings);
  }
}
