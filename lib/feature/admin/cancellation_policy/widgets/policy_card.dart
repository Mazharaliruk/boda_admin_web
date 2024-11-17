import 'package:admin_boda/commons/common_imports/common_libs.dart';

class PolicyCard extends StatefulWidget {
  const PolicyCard({super.key});

  @override
  _PolicyCardState createState() => _PolicyCardState();
}

class _PolicyCardState extends State<PolicyCard> {
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
          Text(
            'Flexible',
            style: getSemiBoldStyle(
                color: context.bodyTextColor, fontSize: MyFonts.size14),
          ),
          Text(
            'Cancellation allowed up to 24 hours before the activity with a full refund.',
            style: getRegularStyle(
                color: context.bodyTextColor, fontSize: MyFonts.size12),
            softWrap: true,
          ),
          Text(
            '24 hours before',
            style: getSemiBoldStyle(
                color: context.bodyTextColor, fontSize: MyFonts.size12),
            softWrap: true,
          ),
          Text(
            '100% Refund ',
            style: getSemiBoldStyle(
                color: context.primary, fontSize: MyFonts.size12),
            softWrap: true,
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
