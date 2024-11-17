import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/dialog/create_banner_dialog.dart';

class BannerPopup extends ConsumerStatefulWidget {
  const BannerPopup({super.key});

  @override
  ConsumerState<BannerPopup> createState() => _SServiceSettingDialogState();
}

class _SServiceSettingDialogState extends ConsumerState<BannerPopup> {
  List<String> bannerType = ['Image Banner', 'Video Banner', 'Text'];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 220.w,
        constraints: BoxConstraints(maxHeight: 180.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: context.whiteColor),
        child: Column(
          children: bannerType
              .map((e) => InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      if (e == 'Image Banner') {
                        showCustomDialog(
                            context: context,
                            content: const CreateBannerDialog(isImage: true));
                      } else if (e == 'Video Banner') {
                        showCustomDialog(
                            context: context,
                            content: const CreateBannerDialog(isImage: false));
                      } else {
                        showCustomDialog(
                            context: context,
                            content: const CreateBannerDialog(istext: true));
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 38.h,
                          child: Text(
                            e,
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size14),
                          ),
                        ),
                        Divider(
                          color: context.lightGreyColor,
                          thickness: 1,
                        )
                      ],
                    ),
                  ))
              .toList(),
        ));
  }
}
