import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors/colors.dart';

class CustomRadioButton extends StatefulWidget {
  final int value;
  final int groupValue;
  final bool hasPadding;
  final void Function(int) onChanged;
  const CustomRadioButton(
      {Key? key,
      required this.value,
      required this.groupValue,
      this.hasPadding = true,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(0.7),
        padding: const EdgeInsets.all(0.7),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                selected ? AppColors.transparentColor : AppColors.blackColor),
        child: Container(
          margin: const EdgeInsets.all(0.5),
          padding: EdgeInsets.all( selected ? 3 : 1),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? AppColors.blueColor : AppColors.whiteColor),
          child: Icon(
            Icons.circle,
            size: 16.r,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
