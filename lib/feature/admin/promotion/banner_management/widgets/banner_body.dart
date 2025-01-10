import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/dialog/banner_popup.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/widgets/banner_card.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../models/inventry/promotion_model.dart';
import '../controller/promotion_controller.dart';

class BannerBody extends ConsumerStatefulWidget {
  const BannerBody({super.key});

  @override
  ConsumerState<BannerBody> createState() => _LoyaltyBodyState();
}

class _LoyaltyBodyState extends ConsumerState<BannerBody> {
  @override
  Widget build(BuildContext context) {
        final promotionController = ref.watch(promotionProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campaign Performance',
                  style: getBoldStyle(
                      color: context.blackColor, fontSize: MyFonts.size22),
                ),
                Text(
                  'Accumulated Result for campaign',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                )
              ],
            ),
            CustomPopup(
              barrierColor: context.primary.withOpacity(0.1),
              backgroundColor: Colors.white,
              content: const BannerPopup(),
              child: Container(
                  width: 150,
                  height: 35,
                  decoration: BoxDecoration(
                      color: context.primary,
                      borderRadius: BorderRadius.circular(6.r)),
                  child: Center(
                    child: Text(
                      'Create Banner',
                      style: getSemiBoldStyle(
                          color: context.whiteColor, fontSize: MyFonts.size12),
                    ),
                  )),
            ),
          ],
        ),
        padding18,
        Row(
          children: [
            card(context: context, title: 'Impressions ', value: '0'),
            card(context: context, title: 'Clicks ', value: '0'),
          ],
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.whiteColor,
          ),
          padding: EdgeInsets.all(AppConstants.padding),
          child: FutureBuilder<List<PromotionModel>>(
            future: promotionController.fetchPromotion(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }else if(!snapshot.hasData){
                return const Text("No Promotion Found");
              }
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 350,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return  BannerCard(promotionModel: snapshot.data![index],);
                  });
            }
          ),
        ))
      ],
    );
  }

  card({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Container(
      height: 80,
      width: 180,
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: context.greyColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size14),
              ),
              SvgPicture.asset(
                AppAssets.viewSvgIcon,
                height: 15,
                width: 15,
              )
            ],
          ),
          padding12,
          Text(
            value,
            style: getSemiBoldStyle(
                color: context.blackColor, fontSize: MyFonts.size20),
          ),
        ],
      ),
    );
  }
}
