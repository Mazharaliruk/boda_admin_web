import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageCommisionDialog extends StatefulWidget {
  const ManageCommisionDialog({super.key});

  @override
  State<ManageCommisionDialog> createState() => _ManageCommisionDialogState();
}

class _ManageCommisionDialogState extends State<ManageCommisionDialog> {
  final commisionTypeCtr = TextEditingController();
  final commisionFeeCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: 584,
      padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 30.h),
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
                )
              ],
            ),
            padding16,
            Text(
              'Manage Commission ',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            padding20,
            CustomTextField(
              enabled: false,
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: commisionTypeCtr,
              hintText: 'App Commission In (%)',
              label: 'App Commission In (%)',
            ),
            CustomTextField(
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: commisionFeeCtr,
              hintText: 'Enter commission fee',
              label: 'Commission fee',
            ),
            padding20,
            Row(
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
                  buttonText: 'Save',
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
