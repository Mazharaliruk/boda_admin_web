import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class ApplyCard extends StatefulWidget {
  const ApplyCard(
      {super.key, this.isSelect = false, required this.onChangeValue});
  final bool isSelect;
  final Function(bool? val) onChangeValue;

  @override
  State<ApplyCard> createState() => _ApplyCardState();
}

class _ApplyCardState extends State<ApplyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              side: BorderSide(color: context.darkGreyColor, width: 2),
              activeColor: context.primary,
              value: widget.isSelect,
              onChanged: widget.onChangeValue,
            ),
            padding12,
            // const CachedCircularNetworkImageWidget(image: 'image', size: 55),
            Image.asset(
              AppAssets.userImage,
              height: 55,
              width: 55,
            ),
            padding12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Laugh with Vir Das / 20.12.2021',
                      style: getSemiBoldStyle(
                          color: context.blackColor, fontSize: MyFonts.size12),
                    ),
                    padding8,
                    Container(
                      height: 17,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: context.primary),
                          color: context.primary.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          'Special Discount - 20%',
                          style: getMediumStyle(
                              color: context.primary, fontSize: MyFonts.size6),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  '10:30 PM, Nukkad Cafe, New Delhi',
                  style: getSemiBoldStyle(
                      color: context.darkGreyColor, fontSize: MyFonts.size10),
                ),
                Row(
                  children: [
                    Image.asset(AppAssets.distanceIcon, height: 10, width: 10),
                    padding8,
                    Text(
                      'Distance Between you 95Km',
                      style: getSemiBoldStyle(
                          color: context.primary, fontSize: MyFonts.size8),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
