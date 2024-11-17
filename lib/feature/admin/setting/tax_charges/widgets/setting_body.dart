import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/show_dialog.dart';
import 'package:admin_boda/feature/admin/setting/tax_charges/dialog/add_tax_charger_dialog.dart';

class SettingBody extends ConsumerStatefulWidget {
  const SettingBody({super.key});

  @override
  ConsumerState<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends ConsumerState<SettingBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Taxes And Charges',
              style: getBoldStyle(
                  color: context.blackColor, fontSize: MyFonts.size22),
            ),
            CustomButton(
              onPressed: () {
                showCustomDialog(
                    context: context,
                    content: const AddTaxChargesDialog(isEdit: false));
              },
              buttonText: 'Add Charges or Taxes',
              buttonHeight: 30,
              buttonWidth: 150,
              fontSize: 10,
            ),
          ],
        ),
        padding12,
        Container(
          height: 58.h,
          width: double.infinity,
          color: context.greyColor,
          padding: const EdgeInsets.only(left: 40, right: 0),
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
                child: Text('Type',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Amount',
                    textAlign: TextAlign.start,
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size12)),
              ),
              SizedBox(
                width: 140,
                child: Text('Description',
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
          child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 140,
                            child: Text('Service Fee',
                                textAlign: TextAlign.start,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('Percentage',
                                textAlign: TextAlign.start,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('25%',
                                textAlign: TextAlign.start,
                                style: getBoldStyle(
                                    color: context.blackColor,
                                    fontSize: MyFonts.size8)),
                          ),
                          SizedBox(
                            width: 140,
                            child: Text('Activity Booking Charges',
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
                                      content: const AddTaxChargesDialog(
                                          isEdit: true));
                                },
                                child: Container(
                                  height: 20,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: context.secondary, width: 1.5),
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
                                onTap: () {},
                                child: Container(
                                  height: 20,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: context.secondary, width: 1.5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Delete',
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
              }),
        )
      ],
    );
  }
}
