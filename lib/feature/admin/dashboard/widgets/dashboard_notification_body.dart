import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/feature/admin/dashboard/widgets/notification_card.dart';

class DashboardNotificationBody extends StatelessWidget {
  const DashboardNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      margin: const EdgeInsets.only(right: 30, bottom: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notification',
            style: getSemiBoldStyle(
                color: context.blackColor, fontSize: MyFonts.size22),
          ),
          padding12,
          Divider(
            color: context.greyColor,
          ),
          padding12,
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const NotificationCard();
                }),
          )
        ],
      ),
    );
  }
}
