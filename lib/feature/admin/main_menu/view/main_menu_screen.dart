import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/commonAppbar.dart';
import 'package:admin_boda/feature/admin/main_menu/controller/main_menu_controller.dart';
import 'package:admin_boda/feature/admin/main_menu/widgets/side_menu.dart';
import 'package:admin_boda/feature/admin/main_menu/widgets/sub_menu.dart';

class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainManu = ref.watch(mainMenuProvider);
    return Scaffold(
      key: mainManu.scaffoldKey,
      appBar: const CommonAppBar(),
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideMenu(),
            mainManu.isOtherScreen ? const SubMenu() : Container(),
            Expanded(
              child: mainManu.viewDetail
                  ? mainManu.viewDetailScreen
                  : mainManu.isOtherScreen
                      ? mainManu.otherScreen[mainManu.otherScreenIndex]
                      : mainManu.screens[mainManu.index],
            ),
          ],
        ),
      ),
    );
  }
}
