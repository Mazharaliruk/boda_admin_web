import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/activity_card.dart';
import 'package:admin_boda/utils/constants/app_constants.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.padding + 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding16,
          Text(
            'Activities',
            style: getMediumStyle(
                color: context.blackColor, fontSize: MyFonts.size17),
          ),
          Text(
            'Overview of your published activities',
            style: getLightStyle(
                color: context.blackColor, fontSize: MyFonts.size14),
          ),
          padding12,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.whiteColor,
            ),
            child: Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 70),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const ActivityCard();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
