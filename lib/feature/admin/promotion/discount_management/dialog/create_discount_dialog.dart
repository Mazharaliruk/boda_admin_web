// ignore_for_file: must_be_immutable

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../models/inventry/discount_model.dart';
import '../controller/discount_controller.dart';

class CreateDiscountDialog extends ConsumerStatefulWidget {
  CreateDiscountDialog({super.key, required this.isEdit, this.discoutModel});
  final bool isEdit;
  DiscountModel? discoutModel;

  @override
  ConsumerState<CreateDiscountDialog> createState() =>
      _CreateDiscountDialogState();
}

class _CreateDiscountDialogState extends ConsumerState<CreateDiscountDialog> {
  final disTitleCtr = TextEditingController();
  final disInPercentageCtr = TextEditingController();
  TextEditingController validFromCtr = TextEditingController();
  TextEditingController validToCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
  void initState() {
    // TODO: implement initState
    if (widget.isEdit) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final discountCtr = ref.read(discountProvider);
        try {
          if (widget.discoutModel != null) {
            final fetchDiscount =
                await discountCtr.fetchDiscountById(widget.discoutModel!.id);
            if (fetchDiscount != null) {
              setState(() {
                disTitleCtr.text = fetchDiscount.name;
                disInPercentageCtr.text =
                    fetchDiscount.discount_percent.toString();

                validFromCtr.text = DateFormat.yMd()
                    .format(fetchDiscount.start_date ?? DateTime.now());
                validToCtr.text = DateFormat.yMd()
                    .format(fetchDiscount.end_date ?? DateTime.now());
              });
            }
          }
        } catch (e) {
          print("Error fetching tax: $e");
        }
      });
      super.initState();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    disTitleCtr.dispose();
    disInPercentageCtr.dispose();
    validFromCtr.dispose();
    validToCtr.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final discountController = ref.watch(discountProvider);
    return Container(
      height: 530,
      width: 584,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: Form(
          key: _formKey,
          child: Column(
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
                validatorFn: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter discount title';
                  }
                  return null;
                },
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: disTitleCtr,
                hintText: 'Enter Discount Title',
                label: 'Title',
              ),
              CustomTextField(
                validatorFn: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter discount in percentage';
                  }
                  return null;
                },
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
                      validatorFn: (p0) {
                        if (p0!.isEmpty) {
                          return 'Please select valid from date';
                        }
                        return null;
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
                      validatorFn: (p0) {
                        if (p0!.isEmpty) {
                          return 'Please select valid to date';
                        }
                        return null;
                      },
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                    onPressed: widget.isEdit
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              if (widget.discoutModel != null) {
                                discountController.updateDiscount(
                                    widget.discoutModel!.copyWith(
                                  name: disTitleCtr.text,
                                  discount_percent:
                                      double.parse(disInPercentageCtr.text),
                                  start_date: _selectedFromDate,
                                  end_date: _selectedToDate,
                                ));
                              }
                            }
                          }
                        : () {
                            if (_formKey.currentState!.validate()) {
                              discountController.saveDiscount({
                                "name": disTitleCtr.text,
                                "discount_percent": disInPercentageCtr.text,
                                "start_date":
                                    _selectedFromDate.toIso8601String(),
                                "end_date": _selectedToDate.toIso8601String(),
                              });
                              Navigator.pop(context);
                            }
                          },
                    buttonText:widget.isEdit ? "Update" : 'Add',
                    buttonHeight: 48,
                    buttonWidth: 141,
                    borderRadius: 14.r,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
