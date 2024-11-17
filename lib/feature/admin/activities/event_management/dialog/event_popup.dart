import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';

class EventPopup extends ConsumerStatefulWidget {
  const EventPopup({super.key, required this.onPress});
  final VoidCallback onPress;

  @override
  ConsumerState<EventPopup> createState() => _EventPopup();
}

class _EventPopup extends ConsumerState<EventPopup> {
  List<String> rating = ['Activate', 'Pending', 'Rejected'];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 120.w,
        constraints: BoxConstraints(maxHeight: 200.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: context.whiteColor),
        child: Column(
          children: rating
              .map((e) => InkWell(
                    onTap: widget.onPress,
                    child: Column(
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
