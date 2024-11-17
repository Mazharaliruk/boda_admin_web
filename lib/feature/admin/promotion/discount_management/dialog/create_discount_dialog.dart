import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CreateDiscountDialog extends StatefulWidget {
  const CreateDiscountDialog({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<CreateDiscountDialog> createState() => _CreateDiscountDialogState();
}

class _CreateDiscountDialogState extends State<CreateDiscountDialog> {
  final disTitleCtr = TextEditingController();
  final disInPercentageCtr = TextEditingController();
  final validFromCtr = TextEditingController();
  final validToCtr = TextEditingController();

  DateTime _selectedFromDate = DateTime.now();
  DateTime _selectedToDate = DateTime.now();

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedFromDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedFromDate) {
      setState(() {
        _selectedFromDate = picked;
        validFromCtr.text = DateFormat.yMd().format(picked);
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedToDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedToDate) {
      setState(() {
        _selectedToDate = picked;
        validToCtr.text = DateFormat.yMd().format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
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
              widget.isEdit ? "Edit Discount" : 'Create Discount',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            CustomTextField(
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: disTitleCtr,
              hintText: 'Enter Discount Title',
              label: 'Title',
            ),
            CustomTextField(
              fillColor: context.whiteColor,
              verticalPadding: 10,
              controller: disInPercentageCtr,
              hintText: 'Enter Discount in percentage',
              label: 'Discount in (%)',
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    onTap: () {
                      _selectFromDate(context);
                    },
                    enabled: false,
                    fillColor: context.whiteColor,
                    verticalPadding: 10,
                    controller: validFromCtr,
                    hintText: 'Select Date',
                    label: 'Valid From',
                    tailingIconPath: AppAssets.calendarSvgIcon,
                  ),
                ),
                padding12,
                Expanded(
                  child: CustomTextField(
                    onTap: () => _selectToDate(context),
                    enabled: false,
                    fillColor: context.whiteColor,
                    verticalPadding: 10,
                    controller: validToCtr,
                    hintText: 'Select Date',
                    label: 'Valid To',
                    tailingIconPath: AppAssets.calendarSvgIcon,
                  ),
                ),
              ],
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
                  buttonText: 'Create',
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
