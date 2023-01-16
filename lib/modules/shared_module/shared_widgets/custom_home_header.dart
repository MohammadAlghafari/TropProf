import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/circle_image_with_border.dart';

import 'circle_container_with_name.dart';

// shared Custom header for home screens
class CustomHomeHeader extends StatelessWidget {
  const CustomHomeHeader(
      {super.key,
      required this.onProfileIconTap,
      required this.photoUrl,
      required this.firstName});

  final Function onProfileIconTap;
  final String? photoUrl;
  final String? firstName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => onProfileIconTap(),
            child: photoUrl != null && photoUrl!.isNotEmpty
                ? CircleImageWithBorder(
                    url: photoUrl!,
                    width: 40.r,
                    height: 40.r,
                  )
                : CircleContainerWithName(
                    width: 40.r, height: 40.r, name: firstName!)),
        /*  Container(
          width: 30,
          height: 30,
          color: AppColors.blackColor,
        ) */
      ],
    );
  }
}
