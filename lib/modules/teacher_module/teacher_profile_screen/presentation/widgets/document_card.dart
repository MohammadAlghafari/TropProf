import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';

import '../../../../shared_module/shared_models/file_model.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({super.key, required this.fileModel});

  final FileModel fileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.grey15Color,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${fileModel.name!.substring(0, 17)}...${fileModel.name!.substring(
                        fileModel.name!.length - 16, fileModel.name!.length)}',
                style: AppTextStyles.robotoRegularBlack,
              ),
              Text(
                '9:30pm 2.80mb',
                style: AppTextStyles.robotoRegularGrey55,
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.cancel_outlined,
            color: AppColors.grey55Color,
          )
        ],
      ),
    );
  }
}
