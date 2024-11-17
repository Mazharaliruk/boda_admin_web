import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

class SendToPopup extends ConsumerStatefulWidget {
  const SendToPopup({super.key, required this.onPress});
  final VoidCallback onPress;

  @override
  ConsumerState<SendToPopup> createState() => _SendToPopupState();
}

class _SendToPopupState extends ConsumerState<SendToPopup> {
  List<String> event = [
    'All',
    'Users',
    'Vendors',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200.w,
        constraints: BoxConstraints(maxHeight: 190.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: context.whiteColor),
        child: Column(
          children: event
              .map((e) => InkWell(
                    onTap: widget.onPress,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 38.h,
                          child: Text(
                            e,
                            style: getBoldStyle(
                                color: context.blackColor,
                                fontSize: MyFonts.size14),
                          ),
                        ),
                        Divider(
                          color: context.lightGreyColor,
                          thickness: 1,
                        )
                      ],
                    ),
                  ))
              .toList(),
        ));
  }
}
