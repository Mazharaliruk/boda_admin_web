import 'dart:io';

import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/commons/common_widgets/custom_button.dart';
import 'package:admin_boda/commons/common_widgets/custom_text_fields.dart';
import 'package:admin_boda/feature/admin/promotion/banner_management/dialog/uplaod_video.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../controller/promotion_controller.dart';
import 'upload_image_widget.dart';

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
  final validFromCtr = TextEditingController();
  final validToCtr = TextEditingController();
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
                    : widget.isImage == true
                        ? PromotionUploadImageWidget(
                            isThumbnail: true,
                            onImageSelected: (image) {
                              setState(() {
                                pickedFile = image;
                              });
                            },
                            title: 'Upload image',
                          )
                        : UploadVideoWidget(
                            title: 'Upload Video',
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
                            validatorFn: (p0) {
                              if (p0!.isEmpty) {
                                return 'Please enter title';
                              }
                              return null;
                            },
                            fillColor: context.whiteColor,
                            verticalPadding: 10,
                            controller: titleCtr,
                            hintText: 'Enter Title',
                            label: 'Title',
                          ),
                          CustomTextField(
                            validatorFn: (p0) {
                              if (p0!.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                            fillColor: context.whiteColor,
                            verticalPadding: 10,
                            controller: ofTextCtr,
                            hintText: 'Enter value',
                            label: '% OFF Text',
                          ),
                          CustomTextField(
                            validatorFn: (p0) {
                              if (p0!.isEmpty) {
                                return 'Please enter description';
                              }
                              return null;
                            },
                            fillColor: context.whiteColor,
                            verticalPadding: 10,
                            controller: description,
                            maxLines: 4,
                            hintText: 'Add some description',
                            label: 'Description',
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  validatorFn: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'Please enter Valid From';
                                    }
                                    return null;
                                  },
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
                                  validatorFn: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'Please enter Valid To';
                                    }
                                    return null;
                                  },
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await discountcontroller.createTextPromotion({
                            "name": titleCtr.text,
                            "description": description.text,
                            "discount_percent": double.parse(ofTextCtr.text),
                            "start_date": _selectedFromDate,
                            "end_date": _selectedToDate,
                        
                          });
                          Navigator.pop(context);
                        }
                        if (pickedFile != null) {
                          discountcontroller
                              .handlePromotionCreation(File(pickedFile!.path));
                          Navigator.pop(context);
                        }
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
