import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/cached_circular_network_image.dart';
import 'package:admin_boda/feature/admin/setting/payment_control/controller/payment_controller.dart';
import 'package:admin_boda/models/sales/payment_model.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:intl/intl.dart';

import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/sales/order_model.dart';
import '../../../../../utils/loading.dart';

class PaymentControlBody extends ConsumerStatefulWidget {
  const PaymentControlBody({super.key});

  @override
  ConsumerState<PaymentControlBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends ConsumerState<PaymentControlBody> {
  @override
  Widget build(BuildContext context) {
    final paymentController = ref.watch(paymentProviderController);
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
          child: FutureBuilder<List<PaymentModel>>(
              future: paymentController.fetchPayment(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return const Center(child: Text("No data found"));
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
                          FutureBuilder<OrderModel>(
                              future:
                                  paymentController.fetchOrderById(data.order),
                              builder: (context, orderSnap) {
                                if (orderSnap.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(child: LoadingWidget());
                                } else if (orderSnap.hasError) {
                                  return Center(
                                      child: Text(orderSnap.error.toString()));
                                } else if (!orderSnap.hasData) {
                                  return const Center(
                                      child: Text("No data found"));
                                }
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CachedCircularNetworkImageWidget(
                                              image: AppAssets.userImage,
                                              size: 35),
                                          FutureBuilder<UserProfileModel>(
                                              future: paymentController
                                                  .fetchUser(orderSnap
                                                      .data!.customer_id),
                                              builder: (context, userSnap) {
                                                if (userSnap.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Center(
                                                      child: LoadingWidget());
                                                } else if (userSnap.hasError) {
                                                  return Center(
                                                      child: Text(userSnap.error
                                                          .toString()));
                                                } else if (!userSnap.hasData) {
                                                  return const Center(
                                                      child: Text(
                                                          "No data found"));
                                                }
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(userSnap.data!.name,
                                                        style: getSemiBoldStyle(
                                                            color: context
                                                                .blackColor,
                                                            fontSize: MyFonts
                                                                .size10)),
                                                    Text(
                                                      userSnap.data!.email,
                                                      style: getRegularStyle(
                                                          color: context
                                                              .lightTextColor,
                                                          fontSize:
                                                              MyFonts.size8),
                                                    )
                                                  ],
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 135,
                                      child: Text('\$ ${data.amount}',
                                          textAlign: TextAlign.center,
                                          style: getBoldStyle(
                                              color: context.blackColor,
                                              fontSize: MyFonts.size8)),
                                    ),
                                    FutureBuilder<EventModel>(
                                        future:
                                            paymentController.fetchEventById(
                                                orderSnap.data!.event),
                                        builder: (context, eventSnap) {
                                          if (eventSnap.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child: LoadingWidget());
                                          } else if (eventSnap.hasError) {
                                            return Center(
                                                child: Text(
                                                    eventSnap.error.toString()));
                                          } else if (!eventSnap.hasData) {
                                            return const Center(
                                                child: Text("No data found"));
                                          }
                                          return Text(
                                            eventSnap.data!.name,
                                            textAlign: TextAlign.center,
                                            style: getBoldStyle(
                                                color: context.blackColor,
                                                fontSize: MyFonts.size8),
                                          );
                                        }),
                                    SizedBox(
                                      width: 135,
                                      child: Text(
                                          DateFormat('dd-MM-yyyy-hh:mm')
                                              .format(data.created_at),
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
                                        border:
                                            Border.all(color: context.primary),
                                      ),
                                      child: Center(
                                        child: Text(
                                          data.status.name,
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
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
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
                                              border: Border.all(
                                                  color: context.secondary),
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
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
                                              borderRadius:
                                                  BorderRadius.circular(2),
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
                                );
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: context.lightGreyColor,
                            ),
                          ),
                        ],
                      );
                    });
              }),
        )
      ],
    );
  }
}
