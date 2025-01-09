// ignore_for_file: must_be_immutable

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/activities/booking_management/controllers/booking_controller.dart';
import 'package:admin_boda/models/sales/order_model.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:admin_boda/utils/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/sales/payment_getway_model.dart';
import '../../../../../models/sales/transaction_model.dart';

class BookingDetailDialog extends StatefulWidget {
  BookingDetailDialog(
      {super.key, required this.order, required this.bookingController});
  OrderModel order;
  BookingController bookingController;

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
            FutureBuilder<UserProfileModel>(
                future: widget.bookingController
                    .fetchUser(widget.order.customer_id),
                builder: (context, userSnap) {
                  if (userSnap.connectionState == ConnectionState.waiting) {
                    return const Center(child: LoadingWidget());
                  } else if (userSnap.hasError) {
                    return Center(child: Text(userSnap.error.toString()));
                  } else if (!userSnap.hasData) {
                    return const Center(child: Text("N/A"));
                  }
                  return Row(
                    children: [
                      userSnap.data!.profile_picture != null
                          ? Image.network(
                              userSnap.data!.profile_picture!,
                              height: 50,
                              width: 50,
                            )
                          : Image.asset(
                              AppAssets.userImage,
                              height: 50,
                              width: 50,
                            ),
                      padding12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${userSnap.data?.name}",
                              style: getSemiBoldStyle(
                                  color: context.blackColor,
                                  fontSize: MyFonts.size15)),
                          Text(
                            '${userSnap.data?.email}',
                            style: getRegularStyle(
                                color: context.lightTextColor,
                                fontSize: MyFonts.size11),
                          )
                        ],
                      ),
                    ],
                  );
                }),
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
            tile(
                title: 'PRICE',
                value:
                    '${widget.order.currency.name} ${widget.order.totalAmount}',
                isBatch: false),
            padding12,
            tile(
                title: 'DISCOUNT',
                value:
                    '- ${widget.order.currency.name} ${widget.order.discount_amount}',
                isBatch: false),
            padding12,
            FutureBuilder<TransactionModel?>(
                future: widget.bookingController
                    .fetchTransactionsByOrder(widget.order.id),
                builder: (context, transactionSnap) {
                  if (transactionSnap.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: LoadingWidget());
                  } else if (transactionSnap.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${transactionSnap.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!transactionSnap.hasData) {
                    return tile(
                        title: 'PAYMENT TYPE',
                        value: 'Orange Pay',
                        isBatch: true,
                        color: context.primary);
                  }

                  // Use the fetched EventModel data
                  final transaction = transactionSnap.data!;
                  return FutureBuilder<PaymentGetwayModel?>(
                      future: widget.bookingController
                          .fetchPaymentGetwayById(transaction.payment_getway),
                      builder: (context, paymentGetwaySnap) {
                        if (paymentGetwaySnap.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: LoadingWidget());
                        } else if (paymentGetwaySnap.hasError) {
                          return Center(
                            child: Text(
                              'Error: ${paymentGetwaySnap.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        } else if (!paymentGetwaySnap.hasData) {
                          return tile(
                              title: 'PAYMENT TYPE',
                              value: 'N/A',
                              isBatch: true,
                              color: context.primary);
                        }

                        // Use the fetched EventModel data
                        final paymentGeteway = paymentGetwaySnap.data!;
                        return tile(
                            title: 'PAYMENT TYPE',
                            value: paymentGeteway.name,
                            isBatch: true,
                            color: context.primary);
                      });
                }),
            padding12,
            tile(
                title: 'BOOKING STATUS',
                value: widget.order.status.name,
                isBatch: true,
                color: MyColors.lightGreen),
            padding12,
            tile(
                title: 'CREATED AT',
                value: DateFormat('yyyy-MM-dd-HH:mm')
                    .format(widget.order.created_at),
                isBatch: false),
            padding12,
            FutureBuilder<EventModel>(
                future:
                    widget.bookingController.fetchEventById(widget.order.event),
                builder: (context, eventSnap) {
                  if (eventSnap.connectionState == ConnectionState.waiting) {
                    return const Center(child: LoadingWidget());
                  } else if (eventSnap.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${eventSnap.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!eventSnap.hasData) {
                    return tile(
                        title: 'ACTIVITY BOOKED',
                        value: "N/A",
                        isBatch: true,
                        color: MyColors.lightGreen);
                  }

                  // Use the fetched EventModel data
                  final event = eventSnap.data!;
                  return tile(
                      title: 'ACTIVITY BOOKED',
                      value: event.name,
                      isBatch: true,
                      color: MyColors.lightGreen);
                }),
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
