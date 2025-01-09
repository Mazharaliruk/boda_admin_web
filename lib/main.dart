import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/auth/view/sign_in_screen.dart';
import 'package:admin_boda/init/init_services.dart';
import 'package:admin_boda/routes/route_manager.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/themes/theme.dart';
import 'package:media_kit/media_kit.dart';
import 'package:video_player_media_kit/video_player_media_kit.dart';
import 'package:admin_boda/feature/admin/main_menu/view/main_menu_screen.dart';

import 'feature/auth/controller/auth_controller.dart';

void main() async {
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

  // Initialize services
  await InitServices.init();

  // Run the app inside ProviderScope to use Riverpod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authContoller.notifier);
    // Check if the user is logged in

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
          // Check if user is logged in and decide the initial screen
          home: FutureBuilder<String?>(
              future: ref.read(authContoller.notifier).fetchAccessToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData) {
                  return const SignInScreen();
                } else {
                 
                  if (authController.isTokenExpired(snapshot.data ?? "")) {
                    print("Token expired");
                    authController.clearTokens();
                  }
                  return const MainMenuScreen();
                }
              }),
        );
      },
    );
  }
}
