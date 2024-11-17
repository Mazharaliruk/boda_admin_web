import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/auth/widgets/logo_widget.dart';
import 'package:admin_boda/feature/auth/widgets/sigin_widget.dart';
import 'package:admin_boda/utils/responsive/responsive.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.whiteColor,
        body: SafeArea(
            child: Responsive.isDesktop(context)
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LogoWidget(),
                      SignInWidget(),
                    ],
                  )
                : Center(
                    child: Text(
                      'Only desktop is supported',
                      style: getSemiBoldStyle(color: context.blackColor),
                    ),
                  )));
  }
}
