import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class RatngFilterPopup extends ConsumerStatefulWidget {
  const RatngFilterPopup({super.key, required this.onPress});
  final VoidCallback onPress;

  @override
  ConsumerState<RatngFilterPopup> createState() =>
      _SServiceSettingDialogState();
}

class _SServiceSettingDialogState extends ConsumerState<RatngFilterPopup> {
  List<String> rating = ['All', '1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120.w,
        constraints: BoxConstraints(maxHeight: 370.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: context.whiteColor),
        child: Column(
          children: rating
              .map((e) => InkWell(
                    onTap: widget.onPress,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 38.h,
                          child: Row(
                            children: [
                              SvgPicture.asset(AppAssets.starSvgIcon,
                                  height: 13, width: 13),
                              padding12,
                              Text(
                                e,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size14),
                              ),
                            ],
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
