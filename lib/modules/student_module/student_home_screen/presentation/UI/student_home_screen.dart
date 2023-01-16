import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_progress_indicator.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/presentation/widgets/teacher_home_drawer.dart';

import '../../../../../constants/images/images.dart';
import '../../../../shared_module/shared_widgets/custom_home_header.dart';
import '../../business_logic/provider/student_home_provider.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentHomeProvider>(builder: (context, provider, _) {
      if (provider.isLoading) {
        return const Scaffold(
          body: CustomProgressIndicator(color: AppColors.pinkColor),
        );
      } else if (provider.studentInfo != null) {
        return Scaffold(
          key: _scaffoldKey,
          //drawer: TeacherHomeDrawer(teacherInfo: provider.studentInfo!),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.teacherHomeBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      /* CustomHomeHeader(
                        photoUrl: provider.studentInfo!.photoUrl,
                        firstName:
                            provider.studentInfo!.generalInformation!.firstName,
                        onProfileIconTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ), */
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
