import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class BannerCard extends ConsumerStatefulWidget {
  const BannerCard({super.key, this.isHome = true});

  final bool isHome;

  @override
  ConsumerState<BannerCard> createState() => _UHomeBannerSectionState();
}

class _UHomeBannerSectionState extends ConsumerState<BannerCard> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<String> imageBanner = [
    AppAssets.bannerImage,
    AppAssets.bannerImage,
    AppAssets.bannerImage,
    AppAssets.bannerImage,
  ];

  @override
  Widget build(BuildContext context) {
    return
        // return ref
        //     .watch(getSpecificLocationBannersProvider(
        //         BannerLocationType.userHome.type))
        //     .when(
        //       data: (banners) {
        //         banners.sort(
        //                 (a, b) => a.orderIndex.compareTo(b.orderIndex));
        //         return banners.isEmpty
        //             ? const SizedBox()
        //             :
        Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.blackColor.withOpacity(0.2))),
      padding: EdgeInsets.all(AppConstants.padding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(AppAssets.moreSvgIcon, height: 20, width: 20),
            ],
          ),
          padding12,
          Stack(children: [
            SizedBox(
                width: 1.sw,
                height: 250.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Swiper(
                        autoplay: true,
                        outer: false,
                        indicatorLayout: PageIndicatorLayout.NONE,
                        itemBuilder: (context, index) {
                          return Image.asset(imageBanner[index],
                              fit: BoxFit.fill);
                        },
                        onIndexChanged: (value) {
                          setState(() {
                            _current = value;
                          });
                        },
                        layout: SwiperLayout.DEFAULT,
                        itemCount: imageBanner.length,
                        pagination: const SwiperPagination(
                            builder: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.transparent,
                              activeColor: Colors.transparent,
                              size: 10,
                              activeSize: 10),
                        )),
                        control: SwiperControl(
                          color: MyColors.black.withOpacity(0.0),
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        child: Wrap(
                            children: map<Widget>(imageBanner, (value, url) {
                          return Container(
                            alignment: Alignment.bottomCenter,
                            width: _current == value ? 18.h : 8,
                            height: 8.h,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: _current == value
                                  ? BorderRadius.circular(20.r)
                                  : BorderRadius.circular(20.r),
                              color: _current == value
                                  ? context.bodyTextColor
                                  : context.whiteColor.withOpacity(0.4),
                            ),
                          );
                        })),
                      ),
                    ],
                  ),
                ))
          ]),
          padding12,
          Divider(
            color: context.lightGreyColor,
            thickness: 1,
          ),
          padding12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Impressions',
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size18),
              ),
              Text(
                '222,455',
                textAlign: TextAlign.end,
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size18),
              ),
            ],
          ),
          padding12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Clicks',
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size18),
              ),
              Text(
                '222,455',
                textAlign: TextAlign.end,
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size18),
              ),
            ],
          ),
        ],
      ),
    );
    //   },
    //   error: (error, s) => const NoItemWidget(text: 'something went wrong'),
    //   loading: () => LoadingWidget(),
    // );
  }
}
