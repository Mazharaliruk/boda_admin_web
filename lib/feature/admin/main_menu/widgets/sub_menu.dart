import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/main_menu/controller/main_menu_controller.dart';

class SubMenu extends ConsumerWidget {
  const SubMenu({super.key});

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
                    Text("          ${mainMenu.title}",
                        style: getBoldStyle(
                            color: context.blackColor,
                            fontSize: MyFonts.size16)),
                  ],
                ),
              ),
              padding24,
              Column(
                  children: mainMenu.otherScreenTitle.map((title) {
                final index = mainMenu.otherScreenTitle.indexOf(title);
                return DrawerListTile(
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

class DrawerListTile extends ConsumerWidget {
  const DrawerListTile({
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
    final mainMenu = ref.watch(mainMenuProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          InkWell(
            // ignore: deprecated_member_use
            overlayColor: MaterialStateProperty.all(MyColors.transparentColor),
            onTap: press,
            child: Container(
              height: 58.h,
              width: 220.w,
              decoration: BoxDecoration(
                color: context.greyColor,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  padding12,
                  Text(
                    title,
                    style: getBoldStyle(
                      color: context.blackColor,
                      fontSize: MyFonts.size14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          padding8,
          Container(
            height: 58.h,
            width: 4.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: mainMenu.otherScreenIndex == index
                  ? context.primary
                  : MyColors.transparentColor,
            ),
          ),
        ],
      ),
    );
  }
}
