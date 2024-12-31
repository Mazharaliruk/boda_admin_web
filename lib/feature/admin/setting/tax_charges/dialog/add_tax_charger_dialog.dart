import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_dropdown_text_field.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../models/core/service_model.dart';
import '../../../../../utils/error_screen.dart';
import '../../../../../utils/loading.dart';
import '../controller/tax_controller.dart';

class AddTaxChargesDialog extends ConsumerStatefulWidget {
  const AddTaxChargesDialog({super.key, required this.isEdit});
  final bool isEdit;

  @override
  ConsumerState<AddTaxChargesDialog> createState() =>
      _AddTaxChargesDialogState();
}

class _AddTaxChargesDialogState extends ConsumerState<AddTaxChargesDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtr = TextEditingController();
  final _amountInPercentageCtr = TextEditingController();
  final _descriptionCtr = TextEditingController();
  final _serviceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taxController = ref.watch(taxProvider);
    return Container(
      height: 610,
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
                widget.isEdit
                    ? "Edit Charges or Taxes"
                    : 'Add Charges or Taxes',
                style: getBoldStyle(
                    color: context.blackColor, fontSize: MyFonts.size22),
              ),
              CustomTextField(
                validatorFn: (validator) {
                  if (validator!.isEmpty) return "Enter title";
                  return null;
                },
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: _titleCtr,
                hintText: 'Enter Title Of Charges Tax',
                label: 'Title',
              ),
              CustomTextField(
                validatorFn: (validator) {
                  if (validator!.isEmpty) {
                    return "Enter Charges Amount In Percentage(%)";
                  }
                  return null;
                },
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: _amountInPercentageCtr,
                hintText: 'Enter Charges Amount In Percentage(%)',
                label: 'Charges Amount In Percentage(%)',
              ),
              FutureBuilder<List<ServiceModel>>(
                  future: taxController.fetchService(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const ErrorScreen();
                    }

                    return CustomDropdownField<ServiceModel>(
                      value: taxController
                          .selectedService, // Track the selected subcategory
                      onChanged: (ServiceModel? selectService) {
                        if (selectService != null) {
                          // Update text controller with the selected subcategory name
                          _serviceController.text = selectService.name;

                          // Optionally, store the entire selected subcategory object
                          taxController.selectedService = selectService;
                        }
                      },
                      items: snapshot
                          .data!, // Pass entire SubCategoryModel objects
                      fillColor: context.whiteColor,
                      verticalPadding: 10,
                      hintText: 'Select Category',
                      label: 'Category',
                      enabled: true, // Changed to true to allow selection
                      validatorFn: (ServiceModel? value) {
                        // Optional validator
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      // Custom item builder to display subcategory name
                      itemBuilder: (ServiceModel subcategory) {
                        return Text(subcategory.name);
                      },
                    );
                  }),
              CustomTextField(
                validatorFn: (validator) {
                  if (validator!.isEmpty) return "Enter description";
                  return null;
                },
                fillColor: context.whiteColor,
                verticalPadding: 10,
                maxLines: 4,
                controller: _descriptionCtr,
                hintText: 'Add some description ',
                label: 'Description',
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        taxController.addTax({
                          "name": _titleCtr.text,
                          "tax_percent":
                              double.parse(_amountInPercentageCtr.text),
                          "description": _descriptionCtr.text,
                          "service_id": taxController.selectedService.id  
                        });
                        Navigator.pop(context);
                      }
                    },
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
      ),
    );
  }
}
