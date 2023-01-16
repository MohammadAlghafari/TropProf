import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Consumer<ForgetPasswordProvider>(builder: (context, provider, _) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomScreenHeader(
                      title: 'Vefrification',
                      imageWidth: 375.w,
                      imageHeight: 200.h,
                      hasBackButton: true),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48.w),
                    child: Text(
                      'Please type the verification code sent on your email.',
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
                      "OTP code",
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
                      hint: 'Type the OTP code',
                      borderColor: AppColors.grey15Color,
                      enableField: provider.isLoading ? false : true,
                      textType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onValid: (value) =>
                          CustomValidator.isRequired(value.toString().trim()),
                      controller: otpController,
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
                                "Verfiier",
                                style: AppTextStyles.robotoRegularWhite,
                              ),
                        onPressed: provider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  provider.otpCode = otpController.text;
                                  RoutingProvider.pushNamed(
                                      routeName: Routes.resetPasswordScreen);
                                }
                              }),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Text(
                      'Vous n\'avez pas reçu d\'e-mail ?',
                      style: AppTextStyles.robotoBoldBlack,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.forgetPassword(email: provider.email);
                        },
                        child: Text(
                          'Resend code',
                          style: AppTextStyles.robotoRegularBlue
                              .copyWith(fontSize: 12.sp),
                        ),
                      ),
                      Text(
                        ' or ',
                        style: AppTextStyles.robotoRegularBlue
                            .copyWith(fontSize: 12.sp),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Try another email',
                          style: AppTextStyles.robotoRegularBlue
                              .copyWith(fontSize: 12.sp),
                        ),
                      ),
                    ],
                  )
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
    otpController.dispose();
    super.dispose();
  }
}
