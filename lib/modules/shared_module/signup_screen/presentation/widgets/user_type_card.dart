import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_radio_button.dart';

class UserTypeCard extends StatelessWidget {
  const UserTypeCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.groupValue,
      required this.value,
      required this.onSelected});

  final String title;
  final String imagePath;
  final int groupValue;
  final int value;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50.w,
        decoration: BoxDecoration(
          color:
              groupValue == value ? AppColors.pinkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25.w,
            ),
            CustomRadioButton(
                value: value,
                groupValue: groupValue,
                hasPadding: false,
                onChanged: (value) => onSelected(value)),
            SizedBox(
              width: 30.w,
            ),
            Column(
              children: [
                Text(
                  'Je suis',
                  style: AppTextStyles.robotoRegularBlack,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  title,
                  style:
                      AppTextStyles.robotoBoldBlack.copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              imagePath,
              width: 120.w,
              height: 88.h,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
