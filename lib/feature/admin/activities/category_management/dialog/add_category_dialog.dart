import 'dart:io';

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/activities/category_management/widgets/upload_image_widget.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../controller/category_management_controller.dart';

class AddCategoryDialog extends ConsumerStatefulWidget {
  const AddCategoryDialog({
    super.key,
  });

  @override
  ConsumerState<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends ConsumerState<AddCategoryDialog> {
  final categoryTitleCtr = TextEditingController();
  final description = TextEditingController();
XFile? pickedFile;
  bool isAvailable = false;

 

  @override
  Widget build(BuildContext context) {
     final subcatgoryCtr = ref.watch(categoryManagementProvider);
    return Container(
      height: 550,
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
                    "Add Category",
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
                validatorFn: (value){
                  if(value!.isEmpty){
                    return 'Please enter Title';
                  }
                  return null;
                },
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: categoryTitleCtr,
                hintText: 'Enter Title',
                label: 'Title',
              ),
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
                    onPressed: () {
                    subcatgoryCtr.saveCategory(
                     {
                       "name": categoryTitleCtr.text,
                       "description": description.text
                    
                     },
                     File(pickedFile!.path)
                    );
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
