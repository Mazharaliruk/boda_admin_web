import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/cached_circular_network_image.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/activities/booking_management/dialog/booking_detail_dialog.dart';
import 'package:admin_boda/feature/admin/main_menu/controller/main_menu_controller.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CashCommissionBody extends ConsumerStatefulWidget {
  const CashCommissionBody({super.key});

  @override
  ConsumerState<CashCommissionBody> createState() => _CashCommissionBodyState();
}

class _CashCommissionBodyState extends ConsumerState<CashCommissionBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            ref.watch(mainMenuProvider).setViewDetail(false);
          },
          child: RotatedBox(
            quarterTurns: 3,
            child: SvgPicture.asset(AppAssets.arrowUpSvgIcon,
                height: 24,
                width: 24,
                colorFilter:
                    ColorFilter.mode(context.blackColor, BlendMode.srcIn)),
          ),
        ),
        padding12,
        Text('Booking Pending Commission',
            style: getBoldStyle(
                color: context.blackColor, fontSize: MyFonts.size22)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Orders Complete',
              style: getMediumStyle(
                  color: context.darkGreyColor, fontSize: MyFonts.size16),
            ),
            Text(
              '90',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size15),
            ),
          ],
        ),
        padding12,
        Container(
          width: MediaQuery.of(context).size.width,
          height: 16,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: context.greyColor),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: context.primary),
              ),
            ],
          ),
        ),
        padding12,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Commission Revenue Services Calculate 12% ',
              style: getMediumStyle(
                  color: context.darkGreyColor, fontSize: MyFonts.size10),
            ),
            Text(
              'CAF 120',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size15),
            ),
          ],
        ),
        padding32,
        Container(
          height: 58.h,
          width: double.infinity,
          color: context.greyColor,
          padding: const EdgeInsets.only(left: 25, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 135,
                child: Text('User',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 115,
                child: Text('Price',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 160,
                child: Text('Coupon',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('Created At',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('Tickets',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('   Status',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CachedCircularNetworkImageWidget(
                                  image: AppAssets.userImage, size: 35),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('James Anderson',
                                      style: getSemiBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size10)),
                                  Text(
                                    'james@gmail.com',
                                    style: getRegularStyle(
                                        color: context.lightTextColor,
                                        fontSize: MyFonts.size8),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 135,
                          child: Text('CFA 30',
                              textAlign: TextAlign.center,
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 0),
                          height: 20,
                          width: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: MyColors.lightGreen.withOpacity(0.2),
                            border: Border.all(color: MyColors.lightGreen),
                          ),
                          child: Center(
                            child: Text(
                              'COIN20',
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 135,
                          child: Text('3/07/2024',
                              textAlign: TextAlign.center,
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8)),
                        ),
                        SizedBox(
                          width: 135,
                          child: Text('    1',
                              textAlign: TextAlign.start,
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          height: 20,
                          width: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: context.errorColor.withOpacity(0.2),
                            border: Border.all(color: context.errorColor),
                          ),
                          child: Center(
                            child: Text(
                              'COIN20',
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8),
                            ),
                          ),
                        ),
                        InkWell(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          onTap: () {
                            showCustomDialog(
                                context: context,
                                content: const BookingDetailDialog());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 85),
                            height: 20,
                            width: 54,
                            decoration: BoxDecoration(
                              gradient: context.buttonGradient,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Text(
                                'Details',
                                style: getBoldStyle(
                                    color: context.whiteColor,
                                    fontSize: MyFonts.size8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        color: context.lightGreyColor,
                      ),
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
