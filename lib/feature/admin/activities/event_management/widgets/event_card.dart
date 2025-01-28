// ignore_for_file: must_be_immutable

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/core/enums/payment/order_status.dart';
import 'package:admin_boda/feature/admin/activities/event_management/controllers/event_controller.dart';
import 'package:admin_boda/feature/admin/activities/event_management/dialog/event_popup.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:admin_boda/utils/loading.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/core/reviews_model.dart';
import '../../../../../models/sales/order_model.dart';

class EventCard extends ConsumerStatefulWidget {
  EventCard({super.key, required this.eventModel});
  EventModel eventModel;

  @override
  ConsumerState<EventCard> createState() => _EventCardState();
}

class _EventCardState extends ConsumerState<EventCard> {
  int bookings = 0;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventContoller = ref.watch(eventProvider);

    return Container(
      decoration: BoxDecoration(
        color: context.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: context.darkGreyColor.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(0, 0))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            height: 125,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: widget.eventModel.image_url != null
                  ? Image.network(
                      widget.eventModel.image_url!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppAssets.uploadIcon,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.eventModel.name,
                          style: getSemiBoldStyle(
                              color: context.blackColor,
                              fontSize: MyFonts.size13),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.locationSvgIcon,
                                height: 10, width: 10),
                            padding8,
                            Text(
                              'New York, USA',
                              style: getSemiBoldStyle(
                                  color: context.blackColor.withOpacity(0.6),
                                  fontSize: MyFonts.size8),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomPopup(
                        barrierColor: context.primary.withOpacity(0.1),
                        backgroundColor: Colors.white,
                        content: EventPopup(onPress: () {}),
                        child: Container(
                          height: 24,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: MyColors.lightGreyColor.withOpacity(0.4),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppAssets.moreSvgIcon,
                                height: 18, width: 18),
                          ),
                        )),
                  ],
                ),
                padding20,
                DottedLine(
                  dashColor: context.lightGreyColor,
                  dashGapLength: 5,
                  dashLength: 5,
                  lineThickness: 2,
                ),
                padding20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<List<OrderModel>>(
                        future: eventContoller
                            .fetchOrdersByEventId(widget.eventModel.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: LoadingWidget());
                          } else if (snapshot.hasError) {
                             return infoCard(
                              title: 'Bookings',
                              value: '0',
                              icon: AppAssets.bookingSvgIcon,
                              context: context,
                            );
                          } else if (!snapshot.hasData) {
                            return infoCard(
                              title: 'Bookings',
                              value: '0',
                              icon: AppAssets.bookingSvgIcon,
                              context: context,
                            );
                          }
                          return infoCard(
                            title: 'Bookings',
                            value: '${snapshot.data!.length}',
                            icon: AppAssets.bookingSvgIcon,
                            context: context,
                          );
                        }),
                    FutureBuilder<List<OrderModel>>(
                        future: eventContoller.fetchOrdersByEventIdAndStatus(
                            widget.eventModel.id, OrderStatus.PENDING.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: LoadingWidget());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else if (!snapshot.hasData) {
                            return infoCard(
                                title: 'Pending',
                                value: '0',
                                icon: AppAssets.pendingSvgIcon,
                                context: context);
                          }
                          return infoCard(
                              title: 'Pending',
                              value: '${snapshot.data!.length}',
                              icon: AppAssets.pendingSvgIcon,
                              context: context);
                        }),
                  ],
                ),
                padding12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    infoCard(
                      title: 'Earning',
                      value: '0',
                      icon: AppAssets.earningSvgIcon,
                      context: context,
                    ),
                    FutureBuilder<List<ReviewsModel>>(
                        future: eventContoller
                            .fetchReviewByEvent(widget.eventModel.id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: LoadingWidget());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else if (!snapshot.hasData) {
                            return infoCard(
                                title: 'Rating',
                                value: '0',
                                icon: AppAssets.starSvgIcon,
                                context: context);
                          }
                          return infoCard(
                              title: 'Rating',
                              value: '0',
                              icon: AppAssets.starSvgIcon,
                              context: context);
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget infoCard({
    required String title,
    required String value,
    required String icon,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(icon, height: 15, width: 15),
        padding8,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title: ",
              style: getSemiBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size12),
            ),
            Text(
              value,
              style: getSemiBoldStyle(
                  color: context.primary, fontSize: MyFonts.size12),
            ),
          ],
        ),
      ],
    );
  }
}
