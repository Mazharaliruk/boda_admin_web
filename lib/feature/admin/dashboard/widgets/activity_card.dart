import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              'May 28',
              style: getLightStyle(
                  color: context.blackColor, fontSize: MyFonts.size10),
            )),
        padding4,
        Image.asset(AppAssets.imgImage, width: 100, height: 100),
        padding8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laugh with Vir Das',
              style: getMediumStyle(
                  color: context.blackColor, fontSize: MyFonts.size17),
            ),
            padding6,
            Row(
              children: [
                SvgPicture.asset(AppAssets.locationSvgIcon,
                    height: 15, width: 15),
                padding2,
                Text(
                  'Distance Between you 95Km',
                  style: getMediumStyle(
                      color: context.blackColor, fontSize: MyFonts.size8),
                ),
              ],
            ),
            padding6,
            Text(
              '\$ 1000',
              style: getMediumStyle(
                  color: context.primary, fontSize: MyFonts.size12),
            ),
          ],
        )
      ],
    );
  }
}
