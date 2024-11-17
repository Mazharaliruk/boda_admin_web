import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class FigureCard extends StatelessWidget {
  const FigureCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              Text(
                'Total Users',
                style: getRegularStyle(
                    color: context.blackColor, fontSize: MyFonts.size14),
              ),
              padding12,
              Text(
                '592k',
                style: getSemiBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size24),
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
