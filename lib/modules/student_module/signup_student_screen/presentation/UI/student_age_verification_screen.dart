import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trop_prof_itfaq/core/extensions/date_extensions.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_button.dart';
import 'package:trop_prof_itfaq/modules/student_module/signup_student_screen/presentation/UI/widgets/age_verification_dialog.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

import '../../../../../constants/colors/colors.dart';
import '../../../../../constants/text_styles/text_styles.dart';
import '../../../../../core/utility/custom_validator.dart';
import '../../../../shared_module/shared_widgets/custom_header_widget.dart';
import '../../../../shared_module/shared_widgets/custom_text_field_widget.dart';

class StudentAgeVerificationScreen extends StatefulWidget {
  const StudentAgeVerificationScreen({super.key});

  @override
  State<StudentAgeVerificationScreen> createState() =>
      _StudentAgeVerificationScreenState();
}

class _StudentAgeVerificationScreenState
    extends State<StudentAgeVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController birthDateController = TextEditingController();
  DateTime birthDate = DateTime.now();

  @override
  void dispose() {
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          CustomScreenHeader(
              title: 'Age verification',
              imageWidth: 375.w,
              imageHeight: 200.h,
              hasBackButton: true),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    'Please enter your date of birth',
                    style: AppTextStyles.robotoRegularBlack
                        .copyWith(color: AppColors.grey55Color),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    controller: birthDateController,
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(DateTime.now().year),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(DateTime.now().year));
                      if (selectedDate != null) {
                        birthDate = selectedDate;
                        birthDateController.text = selectedDate.yyyyMMdd();
                      }
                    },
                    textInputAction: TextInputAction.next,
                    hint: 'yyyy-mm-dd',
                    borderColor: AppColors.grey15Color,
                    enableField: false,
                    textType: TextInputType.text,
                    onValid: (value) =>
                        CustomValidator.isRequired(value.toString().trim()),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'You must be 18 or older to join Trop Prof as a student. If you are under 18 years old, you will be redirected to Parent account.',
                  style: AppTextStyles.robotoRegularBlack
                      .copyWith(fontSize: 13.sp, color: AppColors.grey70Color),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                    buttonContent: Text(
                      'Continue',
                      style: AppTextStyles.robotoMediumWhite,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (DateTime.now().year - birthDate.year < 18) {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const AgeVerificationDialog());
                        } else {
                          RoutingProvider.pushNamed(
                              routeName: Routes.signUpStudentScreen);
                        }
                      }
                    }),
                SizedBox(
                  height: 35.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Go to parent\'s account',
                    style: AppTextStyles.robotoBoldBlack,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
