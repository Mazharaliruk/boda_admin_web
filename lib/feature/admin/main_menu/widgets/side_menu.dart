import 'package:admin_boda/commons/common_dialog/logout_dialog.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/main_menu/controller/main_menu_controller.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenu = ref.watch(mainMenuProvider);
    return SizedBox(
      width: 100.w,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Column(
            children: [
              DrawerListTile(
                  svgSrc: AppAssets.dashSvgIcon,
                  press: () {
                    mainMenu.setViewDetail(false);
                    mainMenu.setTogelOtherScreen(false, '');
                    mainMenu.setIndex(0);
                  },
                  index: 0),
              DrawerListTile(
                  svgSrc: AppAssets.walletSvgIcon,
                  press: () {
                    mainMenu.setViewDetail(false);
                    mainMenu.setTogelOtherScreen(false, '');
                    mainMenu.setIndex(1);
                  },
                  index: 1),
              DrawerListTile(
                  svgSrc: AppAssets.profileSvgIcon,
                  press: () {
                    mainMenu.setIndex(2);
                    mainMenu.setTogelOtherScreen(true, 'People');
                    mainMenu.setOtherScreen(0);
                    mainMenu.setOtherScreenContent(
                        mainMenu.peopleScreen, mainMenu.peopleScreenTitle);
                  },
                  index: 2),
              DrawerListTile(
                  svgSrc: AppAssets.activitySvgIcon,
                  press: () {
                    mainMenu.setViewDetail(false);
                    mainMenu.setIndex(3);
                    mainMenu.setTogelOtherScreen(true, 'Activity');
                    mainMenu.setOtherScreen(0);
                    mainMenu.setOtherScreenContent(
                        mainMenu.activityScreen, mainMenu.activityScreenTitle);
                  },
                  index: 3),
              DrawerListTile(
                  svgSrc: AppAssets.couponSvgIcon,
                  press: () {
                    mainMenu.setViewDetail(false);
                    mainMenu.setIndex(4);
                    mainMenu.setTogelOtherScreen(true, 'Content & Promotion');
                    mainMenu.setOtherScreen(0);
                    mainMenu.setOtherScreenContent(
                        mainMenu.couponScreen, mainMenu.couponScreenTitle);
                  },
                  index: 4),
              DrawerListTile(
                svgSrc: AppAssets.settingsSvgIcon,
                press: () {
                  // mainMenu.setViewDetail(false);
                  // mainMenu.setTogelOtherScreen(false, '');
                  // mainMenu.setIndex(5);
                  mainMenu.setViewDetail(false);
                  mainMenu.setIndex(5);
                  mainMenu.setTogelOtherScreen(true, 'Settings');
                  mainMenu.setOtherScreen(0);
                  mainMenu.setOtherScreenContent(
                      mainMenu.settingsScreen, mainMenu.settingsScreenTitle);
                },
                index: 5,
              ),
              // DrawerListTile(
              //     svgSrc: AppAssets.contestSvgIcon,
              //     press: () {
              //       mainMenu.setViewDetail(false);
              //       mainMenu.setTogelOtherScreen(false, '');
              //       mainMenu.setIndex(6);
              //     },
              //     index: 6),
              DrawerListTile(
                  svgSrc: AppAssets.logoutSvgIcon,
                  press: () {
                    showCustomDialog(
                        context: context, content: const LogoutDialog());
                  },
                  index: 6),
            ],
          ),
          Container(
            width: 1.w,
            height: double.infinity,
            color: context.lightGreyColor,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends ConsumerWidget {
  const DrawerListTile({
    super.key,
    required this.svgSrc,
    required this.press,
    required this.index,
  });

  final String svgSrc;
  final VoidCallback press;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctr = ref.watch(mainMenuProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        // ignore: deprecated_member_use
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: press,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: context.whiteColor,
              child: SvgPicture.asset(
                svgSrc,
                height: 30.h,
                width: 30.w,
              ),
            ),
            ctr.index == index
                ? Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: context.primary,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
    // return
  }
}
