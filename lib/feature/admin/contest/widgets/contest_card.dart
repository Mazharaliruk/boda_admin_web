import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/contest/dialog/view_participate_dialog.dart';

class ContestCard extends StatefulWidget {
  const ContestCard({super.key});

  @override
  _ContestCardState createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
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
              Text(
                'LottOwner',
                style: getSemiBoldStyle(
                    color: context.bodyTextColor, fontSize: MyFonts.size24),
              ),
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                child: Container(
                    height: 35.h,
                    width: 130.h,
                    decoration: BoxDecoration(
                        gradient: context.buttonGradient,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'View Participate',
                        style: getBoldStyle(
                            color: context.whiteColor, fontSize: MyFonts.size9),
                      ),
                    )),
                onTap: () {
                  showCustomDialog(
                    context: context,
                    content: const ViewParticipateDialog(isTimeUp: false),
                  );
                },
              ),
            ],
          ),
          padding12,
          Padding(
            padding: EdgeInsets.only(right: 22.w),
            child: Text(
              'UX design stands for User Experience design. It is the process of designing digital or physical products that are easy to use, intuitive, and enjoyable for the user.',
              style: getRegularStyle(
                  color: context.bodyTextColor, fontSize: MyFonts.size13),
              softWrap: true,
            ),
          ),
          padding12,
          Text(
            '25, May 2022, 12:00 PM - To - 30, May 2023, 03:00 AM',
            style: getBoldStyle(
                color: context.blackColor, fontSize: MyFonts.size16),
          ),
          padding12,
          Text(
            '3,456 Participate ',
            style:
                getBoldStyle(color: context.primary, fontSize: MyFonts.size16),
          ),
        ],
      ),
    );
  }
}
