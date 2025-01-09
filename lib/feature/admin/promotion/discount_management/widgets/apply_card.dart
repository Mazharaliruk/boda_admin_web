import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/models/core/event_model.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplyCard extends StatefulWidget {
   ApplyCard(
      {super.key, this.isSelect = false, required this.onChangeValue, required this.eventModel});
  final bool isSelect;
  final Function(bool? val) onChangeValue;
  EventModel eventModel;

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
                      'Party with friends at night - 2022',
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
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.locationSvgIcon,
                        height: 15, width: 15),
                    padding8,
                    Text(
                      'New York, USA',
                      style: getSemiBoldStyle(
                          color: context.blackColor.withOpacity(0.6),
                          fontSize: MyFonts.size9),
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
