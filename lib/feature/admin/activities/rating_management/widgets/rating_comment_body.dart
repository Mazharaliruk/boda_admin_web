import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/cached_circular_network_image.dart';
import 'package:admin_boda/feature/admin/activities/rating_management/dialog/rating_filter_popup.dart';
import 'package:admin_boda/models/account/user_profile_model.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../models/core/reviews_model.dart';
import '../../../../../utils/loading.dart';
import '../controller/rating_controller.dart';

class RatingCommentBody extends ConsumerStatefulWidget {
  const RatingCommentBody({super.key});

  @override
  ConsumerState<RatingCommentBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends ConsumerState<RatingCommentBody> {
  @override
  Widget build(BuildContext context) {
       final ratingController = ref.watch(ratingProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPopup(
          barrierColor: context.primary.withOpacity(0.1),
          backgroundColor: Colors.white,
          content: RatngFilterPopup(onPress: () {}),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: context.whiteColor,
                borderRadius: BorderRadius.circular(14.r)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(AppAssets.filterSvgIcon,
                  height: 24, width: 24),
            ),
          ),
        ),
        padding12,
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
                width: 135,
                child: Text('    Rating',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 160,
                child: Text('          Comment',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('Activity',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 135,
                child: Text('            Created At',
                    textAlign: TextAlign.center,
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
          child: FutureBuilder<List<ReviewsModel>>(
            future: ratingController.fetchReviews(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: LoadingWidget(),
                );
              }else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }else if(!snapshot.hasData){
                return const Center(child: Text('No data found'),);
              }
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 20, bottom: 100),
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 130,
                              child: FutureBuilder<UserProfileModel>(
                                future: ratingController.fetchByUser(data.user),
                                builder: (context, userSnap) {
                                  if(userSnap.connectionState == ConnectionState.waiting){
                                    return const Center(
                                      child: LoadingWidget(),
                                    );
                                  }else if(userSnap.hasError){
                                    return Center(child: Text(userSnap.error.toString()),);
                                  }else if(!userSnap.hasData){
                                    return const Center(child: Text('N/A'),);
                                  }

                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CachedCircularNetworkImageWidget(
                                          image: AppAssets.userImage, size: 35),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(userSnap.data!.name,
                                              style: getSemiBoldStyle(
                                                  color: context.blackColor,
                                                  fontSize: MyFonts.size10)),
                                          Text(
                                            userSnap.data!.email,
                                            style: getRegularStyle(
                                                color: context.lightTextColor,
                                                fontSize: MyFonts.size8),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              ),
                            ),
                            SizedBox(
                              width: 135,
                              child: Text('4.5',
                                  textAlign: TextAlign.center,
                                  style: getBoldStyle(
                                      color: context.blackColor,
                                      fontSize: MyFonts.size8)),
                            ),
                            SizedBox(
                              width: 135,
                              child: Text('Amazing Event',
                                  textAlign: TextAlign.start,
                                  style: getBoldStyle(
                                      color: context.blackColor,
                                      fontSize: MyFonts.size8)),
                            ),
                            SizedBox(
                              width: 135,
                              child: Text('Welcome to krela ',
                                  textAlign: TextAlign.start,
                                  style: getBoldStyle(
                                      color: context.blackColor,
                                      fontSize: MyFonts.size8)),
                            ),
                            SizedBox(
                              width: 135,
                              child: Text('16/05/2024 03:00:37 PM',
                                  textAlign: TextAlign.start,
                                  style: getBoldStyle(
                                      color: context.blackColor,
                                      fontSize: MyFonts.size8)),
                            ),
                            InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              onTap: () {
                                // showCustomDialog(
                                //     context: context, content: const DeleteUserDialog());
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                            color: context.lightGreyColor,
                          ),
                        ),
                      ],
                    );
                  });
            }
          ),
        )
      ],
    );
  }
}
