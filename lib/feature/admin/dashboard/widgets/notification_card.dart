import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(AppAssets.userImage, height: 50, width: 50),
            padding12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Text(
                    'Emily Tyler sent you a review in Das Dia Activities ',
                    style: getMediumStyle(
                        color: context.blackColor, fontSize: MyFonts.size14),
                  ),
                ),
                Text(
                  'Today 9:30 am',
                  style: getMediumStyle(
                      color: context.darkGreyColor, fontSize: MyFonts.size12),
                ),
              ],
            )
          ],
        ),
        Divider(
          color: context.greyColor,
        ),
      ],
    );
  }
}
