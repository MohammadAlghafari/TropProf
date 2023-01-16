import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';


class CustomBadgeEdit extends StatelessWidget {
  final Function onPress;
  const CustomBadgeEdit({Key? key,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => onPress(),
      child: Container(
        height: 30.h,
        width: 30.h,
        decoration:const BoxDecoration(
          color: AppColors.pinkColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.edit,
          size: 13.r,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
