import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/main_menu/controller/main_menu_controller.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Messages extends ConsumerWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenu = ref.watch(mainMenuProvider);
    return SizedBox(
      width: 285.w,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.h,
                width: 284.w,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(color: context.lightGreyColor))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("       Messages",
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size16)),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SvgPicture.asset(
                            AppAssets.dropDownSvgIcon,
                            colorFilter: ColorFilter.mode(
                                context.blackColor, BlendMode.srcIn),
                          ),
                        ),
                        CircleAvatar(
                          radius: 12.r,
                          backgroundColor: context.lightGreyColor,
                          child: Text(
                            "2",
                            style: getSemiBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              padding24,
              Column(
                  children: mainMenu.otherScreenTitle.map((title) {
                final index = mainMenu.otherScreenTitle.indexOf(title);
                return MessageCard(
                  title: title,
                  press: () {
                    mainMenu.setOtherScreen(index);
                  },
                  index: index,
                );
              }).toList()),
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

class MessageCard extends ConsumerWidget {
  const MessageCard({
    super.key,
    required this.press,
    required this.index,
    required this.title,
  });

  final String title;
  final VoidCallback press;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AppAssets.msgImgImage,
                    height: 48,
                    width: 48,
                    fit: BoxFit.cover,
                  )),
              padding12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Elmer Laverty',
                          style: getSemiBoldStyle(
                              color: context.blackColor,
                              fontSize: MyFonts.size14),
                        ),
                        Text(
                          '12 m',
                          style: getSemiBoldStyle(
                              color: context.darkGreyColor,
                              fontSize: MyFonts.size12),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Haha oh man 🔥',
                    style: getSemiBoldStyle(
                        color: context.darkGreyColor, fontSize: MyFonts.size12),
                  ),
                ],
              ),
            ],
          ),
          padding8,
          Center(
            child: SizedBox(
              width: 265,
              child: Divider(
                color: context.lightGreyColor,
                thickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
