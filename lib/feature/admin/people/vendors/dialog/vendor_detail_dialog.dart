import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorDetailDialog extends ConsumerStatefulWidget {
  const VendorDetailDialog({super.key});

  @override
  ConsumerState<VendorDetailDialog> createState() => _VendorDetailDialogState();
}

class _VendorDetailDialogState extends ConsumerState<VendorDetailDialog> {
  List vendorDetails = [
    {
      'title': 'Earnings',
      'value': '58',
      'trailing': '+8% since last month',
      'icon': AppAssets.earningSvgIcon,
    },
    {
      'title': 'Booking',
      'value': '58',
      'trailing': 'Total bookings',
      'icon': AppAssets.bookingSvgIcon,
    },
    {
      'title': 'Sale',
      'value': 'CFA 14.6K',
      'trailing': 'Total Sale',
      'icon': AppAssets.saleSvgIcon,
    },
    {
      'title': 'Upcoming Bookings',
      'value': '12',
      'trailing': 'Upcoming Bookings 12',
      'icon': AppAssets.bookingSvgIcon,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 584,
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: SingleChildScrollView(
          child: Column(
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
                'Vendor Details',
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size22),
              ),
              padding24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  detailCard(
                      title: vendorDetails[0]['title'],
                      value: vendorDetails[0]['value'],
                      trailing: vendorDetails[0]['trailing'],
                      context: context,
                      icon: vendorDetails[0]['icon']),
                  Container(
                    width: 1.5,
                    height: 100,
                    color: context.lightGreyColor,
                  ),
                  detailCard(
                      title: vendorDetails[1]['title'],
                      value: vendorDetails[1]['value'],
                      trailing: vendorDetails[1]['trailing'],
                      context: context,
                      icon: vendorDetails[1]['icon']),
                ],
              ),
              Divider(
                color: context.lightGreyColor,
                thickness: 1.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  detailCard(
                      title: vendorDetails[2]['title'],
                      value: vendorDetails[2]['value'],
                      trailing: vendorDetails[2]['trailing'],
                      context: context,
                      icon: vendorDetails[2]['icon']),
                  Container(
                    width: 1.5,
                    height: 100,
                    color: context.lightGreyColor,
                  ),
                  detailCard(
                      title: vendorDetails[3]['title'],
                      value: vendorDetails[3]['value'],
                      trailing: vendorDetails[3]['trailing'],
                      context: context,
                      icon: vendorDetails[3]['icon']),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailCard({
    required String title,
    required String value,
    required String trailing,
    required BuildContext context,
    required String icon,
  }) {
    return SizedBox(
      width: 160,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: getMediumStyle(
                        color: context.darkGreyColor, fontSize: MyFonts.size14),
                  ),
                  padding12,
                  SvgPicture.asset(icon, height: 15, width: 15),
                ],
              ),
              padding6,
              Text(
                value,
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size24),
              ),
              padding6,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: context.textFieldColor,
                    borderRadius: BorderRadius.circular(100.r)),
                child: Text(trailing,
                    style: getMediumStyle(
                        color: context.blackColor, fontSize: MyFonts.size13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
