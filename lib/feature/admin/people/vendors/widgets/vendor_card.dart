import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/people/vendors/dialog/delete_user_dialog.dart';
import 'package:admin_boda/feature/admin/people/vendors/dialog/vendor_detail_dialog.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      height: 91.h,
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const CachedCircularNetworkImageWidget(
              //     image: AppAssets.userImage, size: 50),
              Image.asset(AppAssets.userImage, width: 50, height: 50),
              padding12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('James Anderson',
                      style: getBoldStyle(
                          color: context.blackColor, fontSize: MyFonts.size16)),
                  Text(
                    'james@gmail.com',
                    style: getRegularStyle(
                        color: context.lightTextColor,
                        fontSize: MyFonts.size13),
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Phone',
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: context.lightTextColor, fontSize: MyFonts.size14)),
              Text('+1 696 6665',
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size16)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Birthday',
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: context.lightTextColor, fontSize: MyFonts.size14)),
              Text('Apr 12, 1995',
                  textAlign: TextAlign.center,
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size16)),
            ],
          ),
          Row(
            children: [
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  showCustomDialog(
                      context: context, content: const VendorDetailDialog());
                },
                child: Container(
                    height: 35.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: context.primary,
                      borderRadius: BorderRadius.circular(
                        2.r,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Details',
                        style: getBoldStyle(
                            color: context.whiteColor, fontSize: MyFonts.size8),
                      ),
                    )),
              ),
              padding12,
              padding12,
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  showCustomDialog(
                      context: context, content: const DeleteUserDialog());
                },
                child: Container(
                  height: 44.h,
                  width: 44.h,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                      color: context.errorColor.withOpacity(0.13),
                      borderRadius: BorderRadius.circular(14.r)),
                  child: SvgPicture.asset(AppAssets.deleteSvgIcon,
                      height: 24.h, width: 24.w),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
