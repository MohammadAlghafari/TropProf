import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/themes/themes.dart';
import 'package:trop_prof_itfaq/core/singletons/singletons.dart';
import 'package:trop_prof_itfaq/modules/shared_module/login_screen/business_logic/provider/login_provider.dart';
import 'package:trop_prof_itfaq/routes/routes_controller/router.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

import 'modules/parent_module/signup_parent_screen.dart/business_logic/provider/signup_parent_provider.dart';
import 'modules/shared_module/forget_password/business_logic/provider/forget_password_provider.dart';
import 'modules/shared_module/signup_screen/business_logic/signup_provider.dart';
import 'modules/teacher_module/signup_teacher_screen/business_logic/signup_teacher_provider.dart';
import 'modules/student_module/signup_student_screen/business_logic/provider/signup_student_provider.dart';
import 'modules/teacher_module/teacher_home_screen/business_logic/provider/teacher_home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSingletonInstances();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => getIt<LoginProvider>()),
            ChangeNotifierProvider(create: (context) => getIt<ForgetPasswordProvider>()),
            ChangeNotifierProvider(create: (context) => getIt<SignUpProvider>()),
            ChangeNotifierProvider(create: (context) => getIt<SignUpParentProvider>()),
            ChangeNotifierProvider(create: (context) => getIt<SignUpStudentProvider>()),
            ChangeNotifierProvider(create: (context)=>getIt<SignUpTeacherProvider>()),
            ChangeNotifierProvider(create: (context)=>getIt<TeacherHomeProvider>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: RoutingProvider.navigatorKey,
            title: 'Trop Prof',
            theme: AppThemes.appTheme,
            onGenerateRoute: (settings) => generateRoute(settings),
          ),
        );
      },
    );
  }
}
