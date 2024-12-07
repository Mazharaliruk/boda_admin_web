import 'dart:io';

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/activities/category_management/widgets/upload_image_widget.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../commons/common_widgets/custom_dropdown_text_field.dart';
import '../../../../../models/inventry/categories_model.dart';
import '../../../../../utils/error_screen.dart';
import '../../../../../utils/loading.dart';
import '../../category_management/controller/category_management_controller.dart';
import '../controller/sub_category_controller.dart';

class AddSubCategoryDialog extends ConsumerStatefulWidget {
  const AddSubCategoryDialog({super.key});

  @override
  ConsumerState<AddSubCategoryDialog> createState() =>
      _AddSubCategoryDialogState();
}

class _AddSubCategoryDialogState extends ConsumerState<AddSubCategoryDialog> {
  final subCateTitle = TextEditingController();
  final description = TextEditingController();
  final categoryCtr = TextEditingController();
  XFile? pickedFile;
  bool isAvailable = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subCateTitle.dispose();
    description.dispose();
    categoryCtr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subCategoryController = ref.watch(subCategoryManagementProvider);
    final categroyController = ref.watch(categoryManagementProvider);
    return Container(
      height: 700,
      width: 584,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Sub Category',
                    style: getBoldStyle(
                        color: context.blackColor, fontSize: MyFonts.size22),
                  ),
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
              padding48,
              UploadImageWidget(
                isThumbnail: true,
                onImageSelected: (image) {
                  setState(() {
                    pickedFile = image;
                  });
                },
                title: 'Upload Thumbnail image',
              ),
              padding12,
              CustomTextField(
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: subCateTitle,
                hintText: 'Enter Title',
                label: 'Title',
              ),

              FutureBuilder<List<CategoriesModel>>(
                  future: categroyController.fetchCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingWidget();
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const ErrorScreen();
                    }

                    return CustomDropdownField<CategoriesModel>(
                      value: subCategoryController
                          .selectedSubCategory, // Track the selected subcategory
                      onChanged: (CategoriesModel? selectedSubCategory) {
                        if (selectedSubCategory != null) {
                          // Update text controller with the selected subcategory name
                          categoryCtr.text = selectedSubCategory.name;

                          // Optionally, store the entire selected subcategory object
                          subCategoryController.selectedSubCategory =
                              selectedSubCategory;
                        }
                      },
                      items: snapshot
                          .data!, // Pass entire SubCategoryModel objects
                      fillColor: context.whiteColor,
                      verticalPadding: 10,
                      hintText: 'Select Category',
                      label: 'Category',
                      enabled: true, // Changed to true to allow selection
                      validatorFn: (CategoriesModel? value) {
                        // Optional validator
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      // Custom item builder to display subcategory name
                      itemBuilder: (CategoriesModel subcategory) {
                        return Text(subcategory.name);
                      },
                    );
                  }),
            
              CustomTextField(
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: description,
                maxLines: 4,
                hintText: 'Add some description',
                label: 'Description',
              ),
              padding32,
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
                      subCategoryController.saveSubCategory({
                        "name": subCateTitle.text,
                        "description": description.text,
                        "category": subCategoryController
                            .selectedSubCategory!.id,
                      }, File(pickedFile!.path));
                      Navigator.pop(context);
                    },
                    buttonText: 'Save',
                    buttonHeight: 48,
                    buttonWidth: 250,
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
