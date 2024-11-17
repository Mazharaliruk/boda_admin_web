import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:dotted_line/dotted_line.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.index, required this.isCategory});
  final int index;
  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: context.darkGreyColor.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
              offset: const Offset(0, 0))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding12,
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            height: 85,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: Image.asset(
                AppAssets.catIcon,
                height: 75,
                width: 75,
                // fit: index == 0 ? null : BoxFit.cover,
              ),
            ),
          ),
          padding12,
          DottedLine(
            dashColor: context.lightGreyColor,
            dashGapLength: 5,
            dashLength: 5,
            lineThickness: 2,
          ),
          padding12,
          Center(
            child: Text(
              isCategory ? 'Category' : 'Sub Category',
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size12),
            ),
          ),
        ],
      ),
    );
  }
}
