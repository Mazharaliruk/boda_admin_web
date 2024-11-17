import 'package:admin_boda/commons/common_dialog/logout_dialog.dart';
import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/dashboard_notification_body.dart';
import 'package:admin_boda/feature/admin/main_menu/controller/main_menu_controller.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenu = ref.watch(mainMenuProvider);
    return Column(
      children: [
        // padding6,
        Padding(
          padding: EdgeInsets.only(
              left: AppConstants.padding,
              right: AppConstants.padding,
              top: 25.h,
              bottom: 22.h),
          child: Row(
            children: [
              padding12,
              CircleAvatar(
                radius: 30.r,
                backgroundColor: context.whiteColor,
                child: SvgPicture.asset(
                  AppAssets.menuSvgIcon,
                  height: 30.h,
                  width: 30.w,
                ),
              ),
              padding16,
              Text(
                'Constructor',
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size18),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  mainMenu.setViewDetail(false);
                  mainMenu.setTogelOtherScreen(false, '');
                  mainMenu.setIndex(0);
                },
                child: Text(
                  'Dashboard',
                  style: getBoldStyle(
                      color: mainMenu.index == 0
                          ? context.secondary
                          : context.lightBlueColor,
                      fontSize: MyFonts.size13),
                ),
              ),
              padding20,
              InkWell(
                onTap: () {
                  mainMenu.setViewDetail(false);
                  mainMenu.setTogelOtherScreen(false, '');
                  mainMenu.setIndex(7);
                },
                child: Text(
                  'Messages',
                  style: getBoldStyle(
                      color: mainMenu.index == 7
                          ? context.secondary
                          : context.lightBlueColor,
                      fontSize: MyFonts.size13),
                ),
              ),
              padding20,
              InkWell(
                onTap: () {
                  mainMenu.setViewDetail(false);
                  mainMenu.setTogelOtherScreen(false, '');
                  mainMenu.setIndex(8);
                },
                child: Text(
                  'AI',
                  style: getBoldStyle(
                      color: mainMenu.index == 8
                          ? context.secondary
                          : context.lightBlueColor,
                      fontSize: MyFonts.size13),
                ),
              ),
              padding20,
              InkWell(
                onTap: () {
                  mainMenu.setViewDetail(false);
                  mainMenu.setTogelOtherScreen(false, '');
                  mainMenu.setIndex(10);
                },
                child: Text(
                  'Send Notification',
                  style: getBoldStyle(
                    color: mainMenu.index == 10
                        ? context.secondary
                        : context.lightBlueColor,
                    fontSize: MyFonts.size13,
                  ),
                ),
              ),
              padding20,
              InkWell(
                onTap: () {
                  mainMenu.setViewDetail(false);
                  mainMenu.setTogelOtherScreen(false, '');
                  mainMenu.setIndex(11);
                },
                child: Text(
                  'Cancellation Policy',
                  style: getBoldStyle(
                    color: mainMenu.index == 11
                        ? context.secondary
                        : context.lightBlueColor,
                    fontSize: MyFonts.size13,
                  ),
                ),
              ),
              padding20,
              InkWell(
                onTap: () {
                  showCustomDialog(
                      context: context, content: const LogoutDialog());
                },
                child: Text(
                  'Logout',
                  style: getBoldStyle(
                    color: mainMenu.index == 6
                        ? context.secondary
                        : context.lightBlueColor,
                    fontSize: MyFonts.size13,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              SvgPicture.asset(AppAssets.accountSvgIcon,
                  height: 35.h, width: 35.w),
              padding12,
              Text(
                'Clayton Santos',
                style: getBoldStyle(
                    color: context.lightBlueColor, fontSize: MyFonts.size13),
              ),
              padding20,
              mainMenu.index == 0
                  ? Stack(
                      children: [
                        CircleAvatar(
                          radius: 25.r,
                          backgroundColor: context.whiteColor,
                          child: SvgPicture.asset(
                            AppAssets.notificationSvgIcon,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: context.primary,
                          ),
                        )
                      ],
                    )
                  : CustomPopup(
                      barrierColor: context.primary.withOpacity(0.1),
                      backgroundColor: Colors.white,
                      content: const DashboardNotificationBody(),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 25.r,
                            backgroundColor: context.whiteColor,
                            child: SvgPicture.asset(
                              AppAssets.notificationSvgIcon,
                              height: 30.h,
                              width: 30.w,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: context.primary,
                            ),
                          )
                        ],
                      ),
                    ),
              padding16,
            ],
          ),
        ),
        Divider(color: context.lightGreyColor)
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(135.h); // You can adjust the height as needed
}
