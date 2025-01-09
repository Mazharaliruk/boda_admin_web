import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/promotion/discount_management/dialog/apply_discount_dialog.dart';
import 'package:admin_boda/feature/admin/promotion/discount_management/dialog/create_discount_dialog.dart';
import 'package:intl/intl.dart';

import '../../../../../models/inventry/discount_model.dart';
import '../../../../../utils/loading.dart';
import '../controller/discount_controller.dart';

class DiscountBody extends ConsumerStatefulWidget {
  const DiscountBody({super.key});

  @override
  ConsumerState<DiscountBody> createState() => _DiscountBodyState();
}

class _DiscountBodyState extends ConsumerState<DiscountBody> {
  @override
  Widget build(BuildContext context) {
    final discountcontroller = ref.watch(discountProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              onPressed: () {
                showCustomDialog(
                    context: context,
                    content: CreateDiscountDialog(isEdit: false));
              },
              buttonText: 'Add Discount',
              buttonHeight: 30,
              buttonWidth: 100,
              fontSize: 10,
            ),
          ],
        ),
        padding12,
        Container(
          height: 58.h,
          width: double.infinity,
          color: context.greyColor,
          padding: const EdgeInsets.only(left: 20, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                child: Text('Title',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Dis(%)',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Available',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('No. Of Activity',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Valid Until',
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<DiscountModel>>(
              future: discountcontroller.fetchDiscount(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                } else if (!snapshot.hasData) {
                  return const Text("Discount Not Found");
                }
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 100),
                    itemBuilder: (context, index) {
                      final discoutModel = snapshot.data![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 140,
                                  child: Text(discoutModel.name,
                                      textAlign: TextAlign.start,
                                      style: getBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size8)),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: Text(
                                      '${discoutModel.discount_percent}',
                                      textAlign: TextAlign.start,
                                      style: getBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size8)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 100),
                                  height: 20,
                                  width: 54,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: MyColors.lightGreen.withOpacity(0.2),
                                    border:
                                        Border.all(color: MyColors.lightGreen),
                                  ),
                                  child: Center(
                                    child: Text(
                                      discoutModel.is_active ? 'Yes' : "No",
                                      style: getBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: Text('4',
                                      textAlign: TextAlign.center,
                                      style: getBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size8)),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: Text(
                                      discoutModel.start_date != null &&
                                              discoutModel.end_date != null
                                          ? """
                                            "${DateFormat('dd/MM/yyyy').format(discoutModel.start_date!)} 
                                            - TO ${DateFormat('dd/MM/yyyy').format(discoutModel.end_date!)}"
                                          """
                                          : "N/A",
                                      textAlign: TextAlign.start,
                                      style: getBoldStyle(
                                          color: context.blackColor,
                                          fontSize: MyFonts.size8)),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      overlayColor: MaterialStateProperty.all(
                                          MyColors.transparentColor),
                                      onTap: () {
                                        showCustomDialog(
                                            context: context,
                                            content: CreateDiscountDialog(
                                                discoutModel: discoutModel,
                                                isEdit: true));
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: context.secondary,
                                              width: 1.5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Manage',
                                            style: getBoldStyle(
                                                color: context.secondary,
                                                fontSize: MyFonts.size8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    padding6,
                                    InkWell(
                                      overlayColor: MaterialStateProperty.all(
                                          MyColors.transparentColor),
                                      onTap: () {
                                        showCustomDialog(
                                            context: context,
                                            content: ApplyDiscountDialog(
                                              discountcontroller:
                                                  discountcontroller,
                                            ));
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: context.secondary,
                                              width: 1.5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Apply',
                                            style: getBoldStyle(
                                                color: context.secondary,
                                                fontSize: MyFonts.size8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: context.lightGreyColor,
                            ),
                          ),
                        ],
                      );
                    });
              }),
        )
      ],
    );
  }
}
