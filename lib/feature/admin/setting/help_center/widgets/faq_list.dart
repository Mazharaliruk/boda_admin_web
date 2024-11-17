import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/svg.dart';

class FAQItemWidget extends StatefulWidget {
  const FAQItemWidget({super.key});

  @override
  _FAQItemWidgetState createState() => _FAQItemWidgetState();
}

class _FAQItemWidgetState extends State<FAQItemWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.r),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'What is UX design?',
                    style: getSemiBoldStyle(
                        color: context.bodyTextColor, fontSize: MyFonts.size14),
                  ),
                ],
              ),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                child: SvgPicture.asset(
                  isExpanded
                      ? AppAssets.arrowUpSvgIcon
                      : AppAssets.arrowDownSvgIcon,
                  width: 23.w,
                  height: 23.w,
                ),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                    // widget.item.isExpanded = isExpanded;
                  });
                },
              ),
            ],
          ),
          padding12,
          if (isExpanded)
            Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: Text(
                'UX design stands for User Experience design. It is the process of designing digital or physical products that are easy to use, intuitive, and enjoyable for the user.',
                style: getRegularStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size12),
                softWrap: true,
              ),
            ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
