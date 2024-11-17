import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/contest/widgets/user_card.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewParticipateDialog extends StatefulWidget {
  const ViewParticipateDialog({super.key, required this.isTimeUp});
  final bool isTimeUp;

  @override
  State<ViewParticipateDialog> createState() => _ViewParticipateDialogState();
}

class _ViewParticipateDialogState extends State<ViewParticipateDialog> {
  final searchCtr = TextEditingController();
  bool selectAll = false;
  int length = 30;

  List<bool> isSelected = [];
  @override
  void initState() {
    isSelected = List<bool>.filled(length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 900,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  // ignore: deprecated_member_use
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.h,
                    decoration: BoxDecoration(
                        color: context.lightGreyColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(AppAssets.closeSvgIcon),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.isTimeUp
                  ? "Mark As Win User View Participate 3,456 "
                  : 'View Participate 3,456',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            widget.isTimeUp
                ? Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          fillColor: context.whiteColor,
                          controller: searchCtr,
                          hintText: 'Search',
                          label: '',
                          showLabel: false,
                        ),
                      ),
                      Container(width: 400),
                    ],
                  )
                : Container(),
            padding20,
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 50),
                  itemCount: length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return UserCard(
                        isTimeUp: widget.isTimeUp,
                        onChangeValue: (val) {
                          setState(() {
                            isSelected[index] = val!;
                          });
                        },
                        isSelect: isSelected[index]);
                  }),
            ),
            !widget.isTimeUp
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        onPressed: () {},
                        buttonText: 'Cancel',
                        buttonHeight: 48,
                        buttonWidth: 141,
                        borderRadius: 14.r,
                        backColor: context.whiteColor,
                        borderColor: context.secondary,
                        textColor: context.secondary,
                      ),
                      padding12,
                      CustomButton(
                        onPressed: () {},
                        buttonText: 'Done',
                        buttonHeight: 48,
                        buttonWidth: 141,
                        borderRadius: 14.r,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
