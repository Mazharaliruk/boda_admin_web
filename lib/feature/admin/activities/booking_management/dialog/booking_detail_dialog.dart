import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

class BookingDetailDialog extends StatefulWidget {
  const BookingDetailDialog({super.key});

  @override
  State<BookingDetailDialog> createState() => _BookingDetailDialogState();
}

class _BookingDetailDialogState extends State<BookingDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 584,
      padding: const EdgeInsets.all(25),
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
            padding16,
            Text(
              'Booking Details',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            padding40,
            Row(
              children: [
                Image.asset(
                  AppAssets.userImage,
                  height: 50,
                  width: 50,
                ),
                padding12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('James Anderson',
                        style: getSemiBoldStyle(
                            color: context.blackColor,
                            fontSize: MyFonts.size15)),
                    Text(
                      'james@gmail.com',
                      style: getRegularStyle(
                          color: context.lightTextColor,
                          fontSize: MyFonts.size11),
                    )
                  ],
                ),
              ],
            ),
            padding12,
            Text(
              'Description',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size12),
            ),
            padding12,
            ReadMoreText(
              'Blue Lagoon Drive from Reykjavík, the capital of Iceland, to the southeast for about an hour you can reach Blue Lagoon, to the southeast for about an hour you can reach Blue Lagoon',
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: context.primary,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              style: getRegularStyle(
                  color: context.blackColor, fontSize: MyFonts.size12),
              moreStyle: getSemiBoldStyle(
                  color: context.primary, fontSize: MyFonts.size14),
            ),
            padding30,
            tile(title: 'PRICE', value: 'CFA 50', isBatch: false),
            padding12,
            tile(title: 'DISCOUNT', value: '- CFA 10', isBatch: false),
            padding12,
            tile(
                title: 'PAYMENT TYPE',
                value: 'Orange Pay',
                isBatch: true,
                color: context.primary),
            padding12,
            tile(
                title: 'BOOKING STATUS',
                value: 'PENDING',
                isBatch: true,
                color: MyColors.lightGreen),
            padding12,
            tile(
                title: 'CREATED AT',
                value: '16/05/2024 03:00:37 PM',
                isBatch: false),
            padding12,
            tile(
                title: 'ACTIVITY BOOKED',
                value: 'Fun',
                isBatch: true,
                color: MyColors.lightGreen),
            padding12,
          ],
        ),
      ),
    );
  }

  Widget tile(
      {required String title,
      required String value,
      required bool isBatch,
      Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getMediumStyle(
              color: context.darkGreyColor, fontSize: MyFonts.size15),
        ),
        isBatch
            ? Container(
                height: 20,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: color!.withOpacity(0.2),
                  border: Border.all(color: color),
                ),
                child: Center(
                  child: Text(
                    value,
                    style: getMediumStyle(
                        color: context.blackColor, fontSize: MyFonts.size8),
                  ),
                ),
              )
            : Text(
                value,
                style: getSemiBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size16),
              ),
      ],
    );
  }
}
