import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/circle_container_with_name.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/circle_image_with_border.dart';
import 'package:trop_prof_itfaq/modules/teacher_module/teacher_home_screen/data/model/teacher_profile_response_model.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

import '../../../../shared_module/shared_widgets/drawer_item.dart';

class TeacherHomeDrawer extends StatelessWidget {
  const TeacherHomeDrawer({super.key, required this.teacherInfo});

  final TeacherProfileResponseModel teacherInfo;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.w,
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.w, 50.h, 25.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                teacherInfo.photoUrl != null && teacherInfo.photoUrl!.isNotEmpty
                    ? CircleImageWithBorder(
                        url: teacherInfo.photoUrl!, width: 40.r, height: 40.r)
                    : CircleContainerWithName(
                        width: 40.r,
                        height: 40.r,
                        name: teacherInfo.generalInformation!.firstName!),
                SizedBox(
                  width: 17.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teacherInfo.generalInformation!.firstName!,
                      style: AppTextStyles.robotoMediumBlack,
                    ),
                    Text(
                      teacherInfo.generalInformation!.email!,
                      style: AppTextStyles.robotoRegularGrey55
                          .copyWith(fontSize: 11.sp),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Set status',
              style: AppTextStyles.robotoMediumBlack
                  .copyWith(fontSize: 12.sp, color: AppColors.grey30Color),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Switch(
                  value: teacherInfo.isAvailable!,
                  onChanged: (valiue) {},
                  activeColor: AppColors.pinkColor,
                ),
                Text(
                  teacherInfo.isAvailable! ? ' Available' : 'Not available',
                  style: AppTextStyles.robotoRegularBlue,
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              padding: EdgeInsets.all(5.r),
              decoration: BoxDecoration(
                  color: AppColors.blueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: AppColors.blueColor,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Home',
                    style: AppTextStyles.robotoMediumBlue,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            DrawerItem(
              label: 'My courses',
              icon: Icons.folder,
              onTap: () {},
            ),
            SizedBox(
              height: 17.h,
            ),
            DrawerItem(
              label: 'Profile',
              icon: Icons.person,
              onTap: () {
                RoutingProvider.goBack();
                RoutingProvider.pushNamed(
                    routeName: Routes.teacherProfileFirstScreen,
                    arguments: teacherInfo);
              },
            ),
            SizedBox(
              height: 17.h,
            ),
            DrawerItem(
              label: 'My wallet',
              icon: Icons.wallet,
              onTap: () {},
            ),
            SizedBox(
              height: 17.h,
            ),
            DrawerItem(
              label: 'Account settings',
              icon: Icons.settings,
              onTap: () {},
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(7.r),
                  decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Icon(
                    Icons.logout,
                    size: 20.r,
                    color: AppColors.whiteColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Logout',
                  style: AppTextStyles.robotoRegularBlack,
                )
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
