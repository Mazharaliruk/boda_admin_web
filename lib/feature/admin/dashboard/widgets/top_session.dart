import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/models/account/user_profile_model.dart';
import 'package:admin_boda/utils/loading.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/account/vendor_profile_model.dart';
import '../../../../models/sales/order_model.dart';
import '../../../../utils/constants/assets_manager.dart';
import '../controllers/dashboard_controller.dart';

class TopSession extends ConsumerStatefulWidget {
  const TopSession({super.key});

  @override
  ConsumerState<TopSession> createState() => _TopSessionState();
}

class _TopSessionState extends ConsumerState<TopSession> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dashBoardController = ref.watch(dashboardProvider);

    return Wrap(children: [
      Container(
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
                  'Profit',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                ),
                SvgPicture.asset(
                  AppAssets.earningSvgIcon,
                  height: 15,
                  width: 15,
                )
              ],
            ),
            Text(
              '0',
              style: getSemiBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size20),
            ),
          ],
        ),
      ),
      Container(
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
                  'Bookings',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                ),
                SvgPicture.asset(
                  AppAssets.bookingSvgIcon,
                  height: 15,
                  width: 15,
                )
              ],
            ),
           FutureBuilder<List<OrderModel>>(
              future: dashBoardController.fetchOrders(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget(),);
                }else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }else if (!snapshot.hasData) {
                  return const Center(child: Text("No data found"));
                }
                return Text(
                  '${snapshot.data!.length}',
                  style: getSemiBoldStyle(
                      color: context.blackColor, fontSize: MyFonts.size20),
                );
              }
            ),
          ],
        ),
      ),
      Container(
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
                  'Total Users',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                ),
                SvgPicture.asset(
                  AppAssets.bookingSvgIcon,
                  height: 15,
                  width: 15,
                )
              ],
            ),
            FutureBuilder<List<UserProfileModel>>(
              future: dashBoardController.fetchUserList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget(),);
                }else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }else if (!snapshot.hasData) {
                  return const Center(child: Text("No data found"));
                }
                return Text(
                  '${snapshot.data!.length}',
                  style: getSemiBoldStyle(
                      color: context.blackColor, fontSize: MyFonts.size20),
                );
              }
            ),
          ],
        ),
      ),
      Container(
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
                  'Total Venders',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                ),
                SvgPicture.asset(
                  AppAssets.bookingSvgIcon,
                  height: 15,
                  width: 15,
                )
              ],
            ),
           FutureBuilder<List<VendorProfileModel>>(
              future: dashBoardController.fetchVendorList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingWidget(),);
                }else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }else if (!snapshot.hasData) {
                  return const Center(child: Text("No data found"));
                }
                return Text(
                  '${snapshot.data!.length}',
                  style: getSemiBoldStyle(
                      color: context.blackColor, fontSize: MyFonts.size20),
                );
              }
            ),
          ],
        ),
      ),
      Container(
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
                  'Total Sent To Vender',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                ),
                SvgPicture.asset(
                  AppAssets.bookingSvgIcon,
                  height: 15,
                  width: 15,
                )
              ],
            ),
            Text(
              '0',
              style: getSemiBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size20),
            ),
          ],
        ),
      ),
      Container(
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
                  'Total Activities',
                  style: getRegularStyle(
                      color: context.blackColor, fontSize: MyFonts.size14),
                ),
                SvgPicture.asset(
                  AppAssets.bookingSvgIcon,
                  height: 15,
                  width: 15,
                )
              ],
            ),
            Text(
              '0',
              style: getSemiBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size20),
            ),
          ],
        ),
      ),
    ]);
  }
}
