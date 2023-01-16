import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';

import '../../../constants/colors/colors.dart';

// custom button design for the app
class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonContent,
      required this.onPressed,
      this.color})
      : super(key: key);

  final Widget buttonContent;
  final Function? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    bool disabled = onPressed == null;
    return ElevatedButton(
      onPressed: disabled ? null : () => onPressed!(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        )),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          return 0.0;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              // disabled state
              return AppTextStyles.robotoRegularWhite
                  .copyWith(color: color ?? AppColors.blueColor);
            }
            return AppTextStyles.robotoRegularWhite;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              // disabled state
              return AppColors.grey20Color;
            }
            return color ?? AppColors.blueColor;
          },
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
          return Size.fromHeight(45.h);
        }),
      ),
      child: buttonContent,
    );
  }
}
