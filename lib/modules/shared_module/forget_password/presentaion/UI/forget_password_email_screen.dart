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

class ForgetPasswordEmailScreen extends StatefulWidget {
  const ForgetPasswordEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordEmailScreen> createState() =>
      _ForgetPasswordEmailScreenState();
}

class _ForgetPasswordEmailScreenState extends State<ForgetPasswordEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
                      title: 'Forget Password',
                      imageWidth: 375.w,
                      imageHeight: 200.h,
                      hasBackButton: true),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Text(
                      'Enter the email associated with your account and we\'ll send an email with a link to reset your password.',
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
                      "Email address",
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
                      hint: 'Type your email address',
                      borderColor: AppColors.grey15Color,
                      enableField: provider.isLoading ? false : true,
                      textType: TextInputType.emailAddress,
                      onValid: (value) => CustomValidator.validateEmail(
                          value.toString().trim()),
                      controller: emailController,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButton(
                        buttonContent: provider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.whiteColor)
                            : Text(
                                "Envoyer le lien",
                                style: AppTextStyles.robotoRegularWhite,
                              ),
                        onPressed: provider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  bool otpSent = await provider.forgetPassword(
                                      email: emailController.text);
                                  if (otpSent) {
                                    RoutingProvider.pushNamed(
                                        routeName: Routes.otpVerificationScreen);
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
    emailController.dispose();
    super.dispose();
  }
}
