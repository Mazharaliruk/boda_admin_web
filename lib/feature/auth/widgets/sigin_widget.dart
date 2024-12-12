import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/auth/widgets/remenber_pass.dart';
import 'package:admin_boda/routes/route_manager.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/validator.dart';
import '../controller/auth_controller.dart';

class SignInWidget extends ConsumerStatefulWidget {
  const SignInWidget({super.key});

  @override
  ConsumerState<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends ConsumerState<SignInWidget> {
  final _formKey = GlobalKey<FormState>();
  bool passObscure = true;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authContoller);
    return SizedBox(
        width: 700.w,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign In to BODA',
                    style: getMediumStyle(
                        color: context.blackColor, fontSize: MyFonts.size30),
                  ),
                  padding24,
                  CustomTextField(
                    fillColor: context.whiteColor,
                    verticalPadding: 10,
                    validatorFn: (validator) {
                      if (validator!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!emailRegex.hasMatch(validator)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    controller: nameController,
                    hintText: 'Enter your email address',
                    label: 'Email Address',
                  ),
                  padding18,
                  CustomTextField(
                    obscure: passObscure,
                    fillColor: context.whiteColor,
                    verticalPadding: 10,
                    validatorFn: (validator) {
                      if (validator!.isEmpty) {
                        return 'Please enter your password';
                      } else if (!passwordRegex.hasMatch(validator)) {
                        return 'Password must be at least 8 characters long and include both upper and lower case letters';
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: 'Enter your password',
                    label: 'Password',
                    tailingIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passObscure = !passObscure;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: SvgPicture.asset(AppAssets.eyeSvgIcon,
                            width: 24.w, height: 24.h),
                      ),
                    ),
                  ),
                  padding18,
                  const RememberPassword(),
                  padding56,
                  CustomButton(
                    isLoading: false,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.login(nameController.text,
                            passwordController.text, context);
                      }
                    },
                    buttonText: 'Login',
                    buttonHeight: 54.h,
                    buttonWidth: 170.w,
                    backColor: context.primary,
                    isIcon: true,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
