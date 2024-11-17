import 'dart:typed_data';
import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/activities/category_management/widgets/upload_image_widget.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({
    super.key,
  });

  @override
  State<AddCategoryDialog> createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final countryNameCtr = TextEditingController();
  final countryTitleCtr = TextEditingController();
  final description = TextEditingController();
  List<Uint8List> bytes = [];
  List<String> imagePaths = [];
  String thumbnailPath = '';
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
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
                imgPath: (val) {
                  thumbnailPath = val;
                },
                title: 'Upload Thumbnail image',
              ),
              padding12,
              CustomTextField(
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: countryTitleCtr,
                hintText: 'Enter Title',
                label: 'Title',
              ),
              CustomTextField(
                fillColor: context.whiteColor,
                verticalPadding: 10,
                controller: countryTitleCtr,
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
                    onPressed: () {},
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
