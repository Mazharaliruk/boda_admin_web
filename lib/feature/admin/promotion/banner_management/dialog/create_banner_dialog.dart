import 'dart:io';

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/dialog/uplaod_video.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../controller/promotion_controller.dart';

class CreateBannerDialog extends ConsumerStatefulWidget {
  const CreateBannerDialog(
      {super.key, this.isImage = false, this.istext = false});
  final bool? isImage;
  final bool? istext;

  @override
  ConsumerState<CreateBannerDialog> createState() => _CreateBannerDialogState();
}

class _CreateBannerDialogState extends ConsumerState<CreateBannerDialog> {
  final ofTextCtr = TextEditingController();
  final titleCtr = TextEditingController();
  final description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  XFile? pickedFile;
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    final discountcontroller = ref.watch(promotionProvider);

    return Container(
      height: widget.istext == true ? 550 : 400,
      width: 584,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: context.whiteColor, borderRadius: BorderRadius.circular(24.r)),
      child: Scaffold(
        backgroundColor: context.whiteColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create Banner Ad",
                      style: getBoldStyle(
                          color: context.blackColor, fontSize: MyFonts.size22),
                    ),
                    InkWell(
                      // ignore: deprecated_member_use
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
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
                widget.istext == true
                    ? Container()
                    : UploadVideoWidget(
                        title: widget.isImage == true
                            ? 'Upload image'
                            : 'Upload Video',
                        isThumbnail: true,
                        onVideoSelected: (image) {
                          setState(() {
                            pickedFile = image;
                          });
                        },
                      ),
                padding12,
                widget.istext == true
                    ? Column(
                        children: [
                          CustomTextField(
                            fillColor: context.whiteColor,
                            verticalPadding: 10,
                            controller: titleCtr,
                            hintText: 'Enter Title',
                            label: 'Title',
                          ),
                          CustomTextField(
                            fillColor: context.whiteColor,
                            verticalPadding: 10,
                            controller: titleCtr,
                            hintText: 'Enter value',
                            label: '% OFF Text',
                          ),
                          CustomTextField(
                            fillColor: context.whiteColor,
                            verticalPadding: 10,
                            controller: titleCtr,
                            maxLines: 4,
                            hintText: 'Add some description',
                            label: 'Description',
                          ),
                        ],
                      )
                    : Container(),
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
                        discountcontroller
                            .createPromotion({
                              "name":"Promotion",
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
      ),
    );
  }
}
