import 'dart:io';
import 'dart:typed_data';
import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageWidget extends ConsumerStatefulWidget {
  const UploadImageWidget({
    super.key,
    required this.imgPath,
    required this.title,
    required this.isThumbnail,
    this.fileBytes,
  });
  final Function(String imgPath) imgPath;
  final String title;
  final bool isThumbnail;
  final Function(Uint8List path)? fileBytes;

  @override
  ConsumerState<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends ConsumerState<UploadImageWidget> {
  Uint8List? pickedFileBytes;
  File? pickedFile;
  bool isLoading = false;
  getPhoto() async {
    XFile? imgFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imgFile != null) {
      pickedFileBytes = await imgFile.readAsBytes();
      pickedFile = File(imgFile.path);
      setState(() {
        Image.memory(pickedFileBytes!);
        widget.imgPath(imgFile.path);
        widget.isThumbnail ? null : widget.fileBytes!(pickedFileBytes!);
      });
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
          child: widget.isThumbnail && pickedFileBytes != null
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
                          color: context.blackColor, fontSize: MyFonts.size16),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
