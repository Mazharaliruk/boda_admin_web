import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/account/user_profile_model.dart';
import '../controllers/dashboard_controller.dart';

// Replace 'Cum' with ConsumerWidget for Riverpod integration
class FigureCard extends ConsumerWidget {
  const FigureCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Example provider to fetch the total users; replace with your actual provider
    final dashBoardController = ref.watch(dashboardProvider);


    return Container(
      height: 80,
      width: 180,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Users',
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size14),
              ),
              padding12,
              FutureBuilder<List<UserProfileModel>>(
                future: dashBoardController.fetchUserList(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if(snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  else if(!snapshot.hasData){
                     return const Text('No data found');
                  }
                  return Text(
                    snapshot.data?.length.toString() ?? '0',
                    style: getSemiBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size24),
                  );
                }
              ),
            ],
          ),
          SvgPicture.asset(
            AppAssets.earningSvgIcon,
            height: 15,
            width: 15,
          )
        ],
      ),
    );
  }
}
