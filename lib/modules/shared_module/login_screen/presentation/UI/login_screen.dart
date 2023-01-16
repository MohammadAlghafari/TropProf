import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/enums/user_type.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/core/local_storage/storage_manager.dart';
import 'package:trop_prof_itfaq/core/utility/custom_validator.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_button.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_header_widget.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_progress_indicator.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_text_field_widget.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';
import '../../../../../constants/colors/colors.dart';
import '../../business_logic/provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Consumer<LoginProvider>(builder: (context, loginProvider, child) {
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomScreenHeader(
                      title: 'Connextion',
                      imageWidth: 375.w,
                      imageHeight: 200.h,
                      hasBackButton: true),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Email",
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
                      hint: 'Email',
                      borderColor: AppColors.grey15Color,
                      enableField: loginProvider.isLoading ? false : true,
                      textType: TextInputType.emailAddress,
                      onValid: (value) => CustomValidator.validateEmail(
                          value.toString().trim()),
                      controller: email,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Password",
                      style: AppTextStyles.robotoRegularBlack,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomTextField(
                      hint: 'Password',
                      borderColor: AppColors.grey15Color,
                      enableField: loginProvider.isLoading ? false : true,
                      textType: TextInputType.visiblePassword,
                      onValid: (value) =>
                          CustomValidator.validateNumOfChar(value, num: 8),
                      isPassword: true,
                      controller: password,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          RoutingProvider.pushNamed(
                              routeName: Routes.forgetPasswordScreen);
                        },
                        child: const Text(
                          'Forget Password?',
                          // style: AppTextStyles.robotoRegularBlack(14.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButton(
                        buttonContent: loginProvider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.whiteColor)
                            : Text(
                                "Connexion",
                                style: AppTextStyles.robotoRegularWhite,
                              ),
                        onPressed: loginProvider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  bool loggedIn = await loginProvider.login(
                                      username: email.text.trim(),
                                      password: password.text);
                                  if (loggedIn) {
                                    UserType userType =
                                        StorageManager.getUserType();
                                    switch (userType) {
                                      case UserType.teacher:
                                        RoutingProvider
                                            .pushNamedAndRemoveAllBack(
                                                routeName:
                                                    Routes.teacherHomeScreen);
                                        break;
                                      default:
                                    }
                                  }
                                }
                              }),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        RoutingProvider.pushNamed(
                            routeName: Routes.signUpScreen);
                      },
                      child: Text(
                        'Je n\'ai pas de compte',
                        style: AppTextStyles.robotoBoldBlack,
                      ),
                    ),
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
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
