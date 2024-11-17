import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/cached_circular_network_image.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class PaymentControlBody extends ConsumerStatefulWidget {
  const PaymentControlBody({super.key});

  @override
  ConsumerState<PaymentControlBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends ConsumerState<PaymentControlBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Control',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
          ],
        ),
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
                child: Text('   Price',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 160,
                child: Text('Name',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('   Created At',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('      Status',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('IsRefund',
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
                          child: Text('\$ 30',
                              textAlign: TextAlign.center,
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8)),
                        ),
                        Text(
                          'Dance party at the top of the\ntown - 2022',
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                              color: context.blackColor,
                              fontSize: MyFonts.size8),
                        ),
                        SizedBox(
                          width: 135,
                          child: Text('3/07/2024',
                              textAlign: TextAlign.center,
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
                            color: context.primary.withOpacity(0.2),
                            border: Border.all(color: context.primary),
                          ),
                          child: Center(
                            child: Text(
                              'Cancelled',
                              style: getBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size8),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                // showCustomDialog(
                                //     context: context,
                                //     content: const BookingDetailDialog());
                              },
                              child: Container(
                                height: 20,
                                width: 54,
                                decoration: BoxDecoration(
                                  color: context.whiteColor,
                                  border: Border.all(color: context.secondary),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text(
                                    'Manage',
                                    style: getBoldStyle(
                                        color: context.secondary,
                                        fontSize: MyFonts.size8),
                                  ),
                                ),
                              ),
                            ),
                            padding12,
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                // showCustomDialog(
                                //     context: context,
                                //     content: const BookingDetailDialog());
                              },
                              child: Container(
                                height: 20,
                                width: 54,
                                decoration: BoxDecoration(
                                  gradient: context.buttonGradient,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Center(
                                  child: Text(
                                    'Pending',
                                    style: getBoldStyle(
                                        color: context.whiteColor,
                                        fontSize: MyFonts.size8),
                                  ),
                                ),
                              ),
                            ),
                            padding24,
                            padding18,
                          ],
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
