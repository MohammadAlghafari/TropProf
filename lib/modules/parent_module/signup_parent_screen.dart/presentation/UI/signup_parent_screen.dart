import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trop_prof_itfaq/constants/colors/colors.dart';
import 'package:trop_prof_itfaq/constants/text_styles/text_styles.dart';
import 'package:trop_prof_itfaq/core/extensions/date_extensions.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/business_logic/provider/signup_parent_provider.dart';
import 'package:trop_prof_itfaq/modules/parent_module/signup_parent_screen.dart/data/model/signup_parent_request_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_widgets/custom_progress_indicator.dart';
import 'package:trop_prof_itfaq/routes/routes_names/routes_names.dart';
import 'package:trop_prof_itfaq/routes/routes_provider/routes_provider.dart';

import '../../../../../core/utility/custom_validator.dart';
import '../../../../shared_module/shared_widgets/custom_button.dart';
import '../../../../shared_module/shared_widgets/custom_header_widget.dart';
import '../../../../shared_module/shared_widgets/custom_text_field_widget.dart';

// Sign Up Parent Screen Design
class SignUpParentScreen extends StatefulWidget {
  const SignUpParentScreen({super.key});

  @override
  State<SignUpParentScreen> createState() => _SignUpParentScreenState();
}

class _SignUpParentScreenState extends State<SignUpParentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Custom header used in multiple screens
            CustomScreenHeader(
                title: 'Sign up',
                imageWidth: 375.w,
                imageHeight: 200.h,
                hasBackButton: true),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Consumer<SignUpParentProvider>(
                  builder: (context, provider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        'Fill in user details',
                        style: AppTextStyles.robotoRegularBlack
                            .copyWith(color: AppColors.grey55Color),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Prenom",
                                      style: AppTextStyles.robotoRegularBlack,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 155.w,
                                      child: CustomTextField(
                                        controller: firstNameController,
                                        textInputAction: TextInputAction.next,
                                        hint: 'Prenom',
                                        borderColor: AppColors.grey15Color,
                                        enableField:
                                            provider.isLoading ? false : true,
                                        textType: TextInputType.text,
                                        onValid: (value) =>
                                            CustomValidator.isRequired(
                                                value.toString().trim()),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nom",
                                      style: AppTextStyles.robotoRegularBlack,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 155.w,
                                      child: CustomTextField(
                                        controller: lastNameController,
                                        textInputAction: TextInputAction.next,
                                        hint: 'Nom',
                                        borderColor: AppColors.grey15Color,
                                        enableField:
                                            provider.isLoading ? false : true,
                                        textType: TextInputType.text,
                                        onValid: (value) =>
                                            CustomValidator.isRequired(
                                                value.toString().trim()),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Email",
                              style: AppTextStyles.robotoRegularBlack,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              hint: 'Email',
                              borderColor: AppColors.grey15Color,
                              enableField: provider.isLoading ? false : true,
                              textType: TextInputType.emailAddress,
                              onValid: (value) => CustomValidator.validateEmail(
                                  value.toString().trim()),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Date of birth",
                              style: AppTextStyles.robotoRegularBlack,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              controller: birthDateController,
                              onTap: provider.isLoading
                                  ? () {}
                                  : () async {
                                      DateTime? selectedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  DateTime(
                                                      DateTime.now().year - 18),
                                              firstDate: DateTime(1950),
                                              lastDate: DateTime(
                                                  DateTime.now().year - 18));
                                      if (selectedDate != null) {
                                        birthDateController.text =
                                            selectedDate.yyyyMMdd();
                                      }
                                    },
                              textInputAction: TextInputAction.next,
                              hint: 'yyyy-mm-dd',
                              borderColor: AppColors.grey15Color,
                              enableField: false,
                              textType: TextInputType.text,
                              onValid: (value) => CustomValidator.isRequired(
                                  value.toString().trim()),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Créer un mot de passe",
                              style: AppTextStyles.robotoRegularBlack,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              hint: 'passe',
                              isPassword: true,
                              borderColor: AppColors.grey15Color,
                              enableField: provider.isLoading ? false : true,
                              textType: TextInputType.text,
                              onValid: (value) => CustomValidator.isRequired(
                                  value.toString().trim()),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 80.h,
                    ),
                    CustomButton(
                        buttonContent: provider.isLoading
                            ? const CustomProgressIndicator(
                                color: AppColors.whiteColor)
                            : Text(
                                'Inscription',
                                style: AppTextStyles.robotoMediumWhite
                                /*  : AppTextStyles.robotoMediumWhite
                                                .copyWith(color: AppColors.blueColor) */
                                ,
                              ),
                        onPressed: provider.isLoading
                            ? () {}
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  bool success = await provider.signupParent(
                                      requestModel: SignUpParentRequestModel(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          confirmPassword:
                                              passwordController.text,
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          dateOfBirth:
                                              birthDateController.text));
                                  if (success) {
                                    RoutingProvider.pushNamedAndRemoveAllBack(
                                        routeName: Routes.loginScreen);
                                  }
                                }
                              }),
                    SizedBox(
                      height: 50.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'J\'ai déjà un compte',
                          style: AppTextStyles.robotoBoldBlack,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
