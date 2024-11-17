import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventFilterDialog extends StatefulWidget {
  const EventFilterDialog({super.key});

  @override
  State<EventFilterDialog> createState() => _EventFilterDialogState();
}

class _EventFilterDialogState extends State<EventFilterDialog> {
  List<String> category = [
    'All',
    'Catering',
    'Decoration',
    'Photography',
    'Venue'
  ];
  List<String> subCategory = [
    'All',
    'Birthday',
    'Wedding',
    'Anniversary',
  ];
  String selectedActivityType = 'All';
  String selectedStatus = 'All';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 584,
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  // ignore: deprecated_member_use
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.h,
                    decoration: BoxDecoration(
                        color: context.lightGreyColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.closeSvgIcon),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Filter',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            padding40,
            Text(
              'Category',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size16),
            ),
            padding12,
            Wrap(
              spacing: 10,
              children: category
                  .map((e) => InkWell(
                        overlayColor:
                            // ignore: deprecated_member_use
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          setState(() {
                            selectedStatus = e;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              gradient: selectedStatus == e
                                  ? context.buttonGradient
                                  : null,
                              color: context.whiteColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border:
                                  Border.all(color: context.primary, width: 1)),
                          child: Center(
                            child: Text(
                              e,
                              style: getBoldStyle(
                                  color: selectedStatus == e
                                      ? context.whiteColor
                                      : context.primary,
                                  fontSize: MyFonts.size14),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            padding24,
            Text(
              'Sub Category',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size16),
            ),
            padding12,
            Wrap(
              spacing: 10,
              children: subCategory
                  .map((e) => InkWell(
                        overlayColor:
                            // ignore: deprecated_member_use
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () {
                          setState(() {
                            selectedActivityType = e;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                              gradient: selectedActivityType == e
                                  ? context.buttonGradient
                                  : null,
                              color: context.whiteColor,
                              borderRadius: BorderRadius.circular(10.r),
                              border:
                                  Border.all(color: context.primary, width: 1)),
                          child: Center(
                            child: Text(
                              e,
                              style: getBoldStyle(
                                  color: selectedActivityType == e
                                      ? context.whiteColor
                                      : context.primary,
                                  fontSize: MyFonts.size14),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  onPressed: () {},
                  buttonText: 'Apply',
                  buttonHeight: 48,
                  buttonWidth: 141,
                  borderRadius: 14.r,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
