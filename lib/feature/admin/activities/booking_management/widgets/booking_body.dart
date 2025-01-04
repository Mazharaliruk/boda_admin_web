import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/activities/booking_management/dialog/booking_detail_dialog.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:intl/intl.dart';

import '../../../../../models/account/user_profile_model.dart';
import '../../../../../models/core/event_model.dart';
import '../../../../../models/sales/order_model.dart';
import '../../../../../utils/loading.dart';
import '../controllers/booking_controller.dart';

class BookingBody extends ConsumerStatefulWidget {
  const BookingBody({super.key});

  @override
  ConsumerState<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends ConsumerState<BookingBody> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookingController = ref.watch(bookingProvider);
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
                child: Text('Name',
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
                child: Text('Phone',
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
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<OrderModel>>(
              future: bookingController.fetchOrders(),
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
                      final order = snapshot.data![index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 130,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // const CachedCircularNetworkImageWidget(
                                    //     image: AppAssets.userImage, size: 35),
                                    FutureBuilder<UserProfileModel>(
                                        future: bookingController
                                            .fetchUser(order.customer_id),
                                        builder: (context, userSnap) {
                                          if (userSnap.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          } else if (userSnap.hasError) {
                                            return Center(
                                                child: Text(
                                                    userSnap.error.toString()));
                                          } else if (!userSnap.hasData) {
                                            return const Center(
                                                child: Text("N/A"));
                                          }
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(userSnap.data!.name,
                                                  style: getSemiBoldStyle(
                                                      color: context.blackColor,
                                                      fontSize:
                                                          MyFonts.size10)),
                                              Text(
                                                userSnap.data!.email,
                                                style: getRegularStyle(
                                                    color:
                                                        context.lightTextColor,
                                                    fontSize: MyFonts.size8),
                                              )
                                            ],
                                          );
                                        }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 115,
                                child: Text('\$ ${order.totalAmount}',
                                    textAlign: TextAlign.center,
                                    style: getBoldStyle(
                                        color: context.blackColor,
                                        fontSize: MyFonts.size8)),
                              ),
                              SizedBox(
                                  width: 160,
                                  child: FutureBuilder<EventModel>(
                                    future: bookingController
                                        .fetchEventById(order.event),
                                    builder: (context, eventSnap) {
                                      if (eventSnap.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                       else if (eventSnap.hasError) {
                                        print(eventSnap.error);
                                        return Center(
                                          child: Text(
                                            'Error: ${eventSnap.error}',
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        );
                                      } 
                                      else if (!eventSnap.hasData) {
                                        return const Center(
                                          child: Text(
                                            "N/A",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        );
                                      }

                                      // Use the fetched EventModel data
                                      final event = eventSnap.data!;
                                      return Text(
                                        event.name, // Display the event name
                                        textAlign: TextAlign.center,
                                        style: getBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size8,
                                        ),
                                      );
                                    },
                                  )),
                              SizedBox(
                                width: 135,
                                child: Text(
                                    DateFormat('dd-MM-yyyy-hh:mm')
                                        .format(order.created_at),
                                    textAlign: TextAlign.center,
                                    style: getBoldStyle(
                                        color: context.blackColor,
                                        fontSize: MyFonts.size8)),
                              ),
                              SizedBox(
                                width: 135,
                                child: FutureBuilder<UserProfileModel>(
                                    future: bookingController
                                        .fetchUser(order.customer_id),
                                    builder: (context, userSnap) {
                                      if (userSnap.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (userSnap.hasError) {
                                        return Center(
                                            child: Text(
                                                userSnap.error.toString()));
                                      } else if (!userSnap.hasData) {
                                        return const Center(child: Text("N/A"));
                                      }
                                      return Text('+${userSnap.data!.phone}',
                                          textAlign: TextAlign.start,
                                          style: getBoldStyle(
                                              color: context.blackColor,
                                              fontSize: MyFonts.size8));
                                    }),
                              ),
                              SizedBox(
                                width: 135,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 30),
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color:
                                            context.errorColor.withOpacity(0.2),
                                        border: Border.all(
                                            color: context.errorColor),
                                      ),
                                      child: Center(
                                        child: Text(
                                          order.status.name,
                                          style: getBoldStyle(
                                              color: context.blackColor,
                                              fontSize: MyFonts.size8),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                      onTap: () {
                                        showCustomDialog(
                                            context: context,
                                            content:
                                                const BookingDetailDialog());
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          gradient: context.buttonGradient,
                                          borderRadius:
                                              BorderRadius.circular(2),
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
                              ),
                            ],
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
