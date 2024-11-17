import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/auth/view/sign_in_screen.dart';
import 'package:admin_boda/routes/route_manager.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.delayed(const Duration(seconds: 4), () async {});
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(AppConstants.screenWidget, AppConstants.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BODA',
          theme: lightThemeData(context),
          themeMode: ThemeMode.light,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: const SignInScreen(),
        );

      },
    );
  }
}
