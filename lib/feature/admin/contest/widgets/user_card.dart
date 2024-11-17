import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/cached_circular_network_image.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';

class UserCard extends StatefulWidget {
  const UserCard(
      {super.key,
      this.isSelect = false,
      required this.onChangeValue,
      required this.isTimeUp});
  final bool isSelect;
  final Function(bool? val) onChangeValue;
  final bool isTimeUp;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            widget.isTimeUp
                ? Checkbox(
                    side: BorderSide(color: context.darkGreyColor, width: 2),
                    activeColor: context.primary,
                    value: widget.isSelect,
                    onChanged: widget.onChangeValue,
                  )
                : const SizedBox.shrink(),
            padding12,
            // const CachedCircularNetworkImageWidget(image: 'image', size: 55),
            const CachedCircularNetworkImageWidget(
                image: AppAssets.userImage, size: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('James Anderson',
                    style: getSemiBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
                Text(
                  'james@gmail.com',
                  style: getRegularStyle(
                      color: context.lightTextColor, fontSize: MyFonts.size9),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
