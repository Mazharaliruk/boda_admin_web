// ignore_for_file: must_be_immutable

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/promotion/discount_management/widgets/apply_card.dart';
import 'package:admin_boda/models/core/event_model.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:admin_boda/utils/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/discount_controller.dart';

class ApplyDiscountDialog extends StatefulWidget {
  ApplyDiscountDialog({super.key, required this.discountcontroller});
  DiscountController discountcontroller;

  @override
  State<ApplyDiscountDialog> createState() => _ApplyDiscountDialogState();
}

class _ApplyDiscountDialogState extends State<ApplyDiscountDialog> {
  final searchCtr = TextEditingController();

  List<EventModel> events = [];
  List<EventModel> selectedEvents = [];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
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
              'Apply Discount',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            Row(
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
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 6),
                  child: CustomButton(
                    onPressed: () {},
                    buttonText: 'Apply To Selected',
                    buttonHeight: 50,
                    buttonWidth: 120,
                    fontSize: 10,
                    borderRadius: 14,
                  ),
                ),
              ],
            ),
            padding20,
            Row(
              children: [
                Checkbox(
                    side: BorderSide(color: context.darkGreyColor, width: 2),
                    activeColor: context.primary,
                    value: false,
                    onChanged: (val) {
                   
                    }),
                Text(
                  'Select All',
                  style: getBoldStyle(
                      color: context.darkGreyColor, fontSize: MyFonts.size14),
                ),
              ],
            ),
            padding12,
            Expanded(
              child: FutureBuilder<List<EventModel>>(
                  future: widget.discountcontroller.fetchEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    } else if (!snapshot.hasData) {
                      return const Text("Events Not Found");
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ApplyCard(
                            eventModel: snapshot.data![index],
                              onChangeValue: (val) {
                             
                              },
                              isSelect: false);
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
