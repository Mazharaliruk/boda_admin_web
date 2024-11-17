import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/cached_circular_network_image.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class PaymentBody extends ConsumerStatefulWidget {
  const PaymentBody({super.key});

  @override
  ConsumerState<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends ConsumerState<PaymentBody> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 412.w,
          child: CustomTextField(
            controller: searchController,
            hintText: 'Search',
            showLabel: false,
            label: '',
            leadigingIconPath: AppAssets.searchSvgIcon,
          ),
        ),
        padding12,
        Container(
          height: 58.h,
          width: double.infinity,
          color: context.greyColor,
          padding: const EdgeInsets.only(left: 60, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                child: Text('User',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Transaction ID',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Booking ID',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Tra. Date',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('      Total Tra.',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Card Number',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('        Status',
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
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 140,
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
                            width: 140,
                            child: Text('c53f319a-50dc-44e5-9df7',
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('c53f319a-50dc-44e5-9df7',
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('16/05/2024 03:00:37 PM',
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('15   ',
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                text: '3589*** *** *** 2300',
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('Paid',
                                textAlign: TextAlign.center,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
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
                  ),
                );
              }),
        )
      ],
    );
  }
}
