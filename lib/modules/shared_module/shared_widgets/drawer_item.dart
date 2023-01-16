import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';

import '../../../constants/text_styles/text_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      splashColor: AppColors.blueColor.withOpacity(0.1),
      hoverColor: AppColors.blueColor.withOpacity(0.1),
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.blackColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              label,
              style: AppTextStyles.robotoMediumBlack,
            )
          ],
        ),
      ),
    );
  }
}
