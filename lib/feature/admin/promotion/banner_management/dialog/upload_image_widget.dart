import 'dart:typed_data';
import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class PromotionUploadImageWidget extends ConsumerStatefulWidget {
  const PromotionUploadImageWidget({
    super.key,
    required this.onImageSelected,
    required this.title,
    required this.isThumbnail,
  });

  final Function(XFile? imageFile) onImageSelected; // Callback to return XFile
  final String title;
  final bool isThumbnail;

  @override
  ConsumerState<PromotionUploadImageWidget> createState() => _PromotionUploadImageWidgetState();
}

class _PromotionUploadImageWidgetState extends ConsumerState<PromotionUploadImageWidget> {
  Uint8List? pickedFileBytes;
  XFile? pickedFile;

  Future<void> getPhoto() async {
    // Pick an image from the gallery
    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedFileBytes = await pickedFile!.readAsBytes();
      setState(() {});
      // Return the selected image file
      widget.onImageSelected(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: getPhoto,
      child: DottedBorder(
        color: context.primary,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        radius: Radius.circular(4.r),
        dashPattern: const [6, 6],
        child: SizedBox(
          height: 130,
          width: 360,
          child: pickedFileBytes != null
              ? Image.memory(
                  pickedFileBytes!,
                  fit: BoxFit.cover,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.uploadIcon, height: 45, width: 45),
                    padding16,
                    Text(
                      widget.title,
                      style: getSemiBoldStyle(
                        color: context.blackColor,
                        fontSize: MyFonts.size16,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
