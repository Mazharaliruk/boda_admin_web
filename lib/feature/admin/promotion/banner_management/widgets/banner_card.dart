// ignore_for_file: must_be_immutable

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/widgets/full_screen_video_player.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

import '../../../../../models/inventry/promotion_model.dart';

class BannerCard extends ConsumerStatefulWidget {
  BannerCard({super.key, this.isHome = true, required this.promotionModel});

  final bool isHome;
  PromotionModel promotionModel;

  @override
  ConsumerState<BannerCard> createState() => _UHomeBannerSectionState();
}

class _UHomeBannerSectionState extends ConsumerState<BannerCard> {
  int _current = 0;
  late final Player _player;
  late final VideoController _videoController;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    // Initialize the VideoController if there's a video URL
    _player = Player();
    _videoController = VideoController(_player);
    // Initialize the video player if a video URL is available
    if (widget.promotionModel.video_url != null) {
      initializeVideoPlayer(widget.promotionModel.video_url!);
    }
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is removed from the widget tree
    _player.dispose();
    super.dispose();
  }

  Future<void> initializeVideoPlayer(String videoUrl) async {
    try {
      // Dispose of any existing media

      // Recreate player and video controller
      // player = Player();
      // videoController = VideoController(player);

      // Open the selected video file
      await _player.open(Media(videoUrl));

      // Safely update state only if the widget is still mounted
      if (mounted) {
        setState(() {});
      }

      // Callback with selected file
    } catch (e) {
      print('Detailed Video Initialization Error: $e');

      // Provide error feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to initialize video: ${e.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

   Future<void> _enterFullscreen()async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullscreenVideoPlayer(controller: _videoController, player: _player,
        onExitFullscreen: ()async{
          Navigator.pop(context);
        },),


      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageBanner = [widget.promotionModel.image_url ?? ''];

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
                      widget.promotionModel.video_url != null
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Video(
                                  onEnterFullscreen: _enterFullscreen,
                                  controller: _videoController,
                                  width: 360,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                                Positioned(
                                  child: IconButton(
                                    iconSize: 50,
                                    icon: Icon(
                                      _player.state.playing
                                          ? Icons.pause_circle_filled
                                          : Icons.play_circle_fill,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (_player.state.playing) {
                                          _player.pause();
                                        } else {
                                          _player.play();
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Swiper(
                              autoplay: true,
                              outer: false,
                              indicatorLayout: PageIndicatorLayout.NONE,
                              itemBuilder: (context, index) {
                                return Image.network(imageBanner[index],
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
                '0',
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
                '0',
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
