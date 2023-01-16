import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/core/utility/custom_validator.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_button.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_header_widget.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_progress_indicator.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_text_field_widget.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';
import '../../../../../constants/colors/colors.dart';
import '../../business_logic/provider/forget_password_provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<ForgetPasswordProvider>(
            builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomScreenHeader(
                      title: 'Reset Password',
                      imageWidth: 375.w,
                      imageHeight: 200.h,
                      hasBackButton: true),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Text(
                      'Your new password must be different from your previous used passwords.',
                      style: AppTextStyles.robotoRegularBlack
                          .copyWith(fontSize: 15.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "New Password",
                      style: AppTextStyles.robotoRegularBlack,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomTextField(
                      textInputAction: TextInputAction.next,
                      hint: 'Type your new password',
                      isPassword: true,
                      borderColor: AppColors.grey15Color,
                      enableField: provider.isLoading ? false : true,
                      textType: TextInputType.emailAddress,
                      onValid: (value) =>
                          CustomValidator.isRequired(value.toString().trim()),
                      controller: passwordController,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Confirm Password",
                      style: AppTextStyles.robotoRegularBlack,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomTextField(
                      textInputAction: TextInputAction.done,
                      hint: 'Confirm your password',
                      isPassword: true,
                      borderColor: AppColors.grey15Color,
                      enableField: provider.isLoading ? false : true,
                      textType: TextInputType.emailAddress,
                      onValid: (value) => CustomValidator.matchPassword(
                          value.toString().trim(),
                          passwordController.text.trim()),
                      controller: confirmPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButton(
                        buttonContent: provider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.whiteColor)
                            : Text(
                                "Reset Password",
                                style: AppTextStyles.robotoRegularWhite,
                              ),
                        onPressed: provider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  bool reset = await provider.resetPassword(
                                      password: passwordController.text);
                                  if (reset) {
                                    RoutingProvider.pushNamedAndRemoveAllBack(
                                        routeName: Routes.loginScreen);
                                  }
                                }
                              }),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
