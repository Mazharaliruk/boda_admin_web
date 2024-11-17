import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTaxChargesDialog extends StatefulWidget {
  const AddTaxChargesDialog({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddTaxChargesDialog> createState() => _AddTaxChargesDialogState();
}

class _AddTaxChargesDialogState extends State<AddTaxChargesDialog> {
  final titleCtr = TextEditingController();
  final amountInPercentageCtr = TextEditingController();
  final descriptionCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      width: 584,
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
                )
              ],
            ),
            Text(
              widget.isEdit ? "Edit Charges or Taxes" : 'Add Charges or Taxes',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            CustomTextField(
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: titleCtr,
              hintText: 'Enter Title Of Charges Tax',
              label: 'Title',
            ),
            CustomTextField(
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: amountInPercentageCtr,
              hintText: 'Enter Charges Amount In Percentage(%)',
              label: 'Charges Amount In Percentage(%)',
            ),
            CustomTextField(
              fillColor: context.whiteColor,
              verticalPadding: 10,
              maxLines: 4,
              controller: descriptionCtr,
              hintText: 'Add some description ',
              label: 'Description',
            ),
            padding40,
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
                  buttonText: widget.isEdit ? "Update" : 'Add',
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
