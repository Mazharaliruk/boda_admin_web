import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/auth/view/sign_in_screen.dart';
import 'package:admin_boda/routes/route_manager.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/themes/theme.dart';
import 'package:media_kit/media_kit.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
     MediaKit.ensureInitialized();
    VideoPlayerMediaKit.ensureInitialized(
    macOS: true,
    windows: true,
    linux: true,
    web: true,
    android: true,
    iOS: true,
  );
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
