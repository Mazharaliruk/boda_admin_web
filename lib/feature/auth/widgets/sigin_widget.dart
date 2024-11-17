import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/auth/widgets/remenber_pass.dart';
import 'package:admin_boda/routes/route_manager.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInWidget extends ConsumerStatefulWidget {
  const SignInWidget({super.key});

  @override
  ConsumerState<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends ConsumerState<SignInWidget> {
  bool passObscure = true;
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 700.w,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
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
                  controller: nameController,
                  hintText: 'Enter your email address',
                  label: 'Email Address',
                ),
                padding18,
                CustomTextField(
                  obscure: passObscure,
                  fillColor: context.whiteColor,
                  verticalPadding: 10,
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
                    Navigator.pushNamed(context, AppRoutes.mainMenuScreen);
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
        ));
  }
}
