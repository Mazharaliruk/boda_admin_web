import 'dart:io';
import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_functions/pick_chat_image_from_gallery.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInputField extends ConsumerStatefulWidget {
  const ChatInputField({
    super.key,
    required this.receiverUserId,
    required this.recieverName,
  });
  final String receiverUserId;
  final String recieverName;

  @override
  ConsumerState<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends ConsumerState<ChatInputField> {
  bool isShowEmojiContainer = false;
  final TextEditingController _messageController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isRecorderInit = false;
  bool isRecording = false;
  bool isFieldEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void sendFileMessage(
    File file,
    // MessageEnum messageEnum,
  ) {
    // UserModel userModel = ref.read(authNotifierCtr).userModel!;
    // ref.read(chatControllerProvider).sendFileMessage(
    //       context,
    //       file,
    //       widget.receiverUserId,
    //       messageEnum,
    //       userModel,
    //     );
  }

  void sendTextMessage() async {
    // if (_messageController.text != '') {
    //   UserModel userModel = ref.read(authNotifierCtr).userModel!;
    //   ref.read(chatControllerProvider).sendTextMessage(
    //         context: context,
    //         text: _messageController.text.trim(),
    //         receiverUserId: widget.receiverUserId,
    //         userModel: userModel,
    //       );
    // } else {
    //   var tempDir = await getTemporaryDirectory();
    //   var path = '${tempDir.path}/flutter_sound.aac';
    //   if (!isRecorderInit) {
    //     return;
    //   }
    //   if (isRecording) {
    //     await _soundRecorder!.stopRecorder();
    //     sendFileMessage(File(path), MessageEnum.audio);
    //   } else {
    //     await _soundRecorder!.startRecorder(toFile: path);
    //   }
    //   setState(() {
    //     isRecording = !isRecording;
    //   });
    // }
    // sendNotification(description: _messageController.text);
    // setState(() {
    //   _messageController.text = '';
    // });
  }

  sendNotification({required String description}) async {
    // final userModel = ref.read(authNotifierCtr).userModel!;
    // UserModel recieverUser = await ref
    //     .read(authControllerProvider.notifier)
    //     .getUserInfoByUidFuture(widget.receiverUserId);

    // NotificationModel model = NotificationModel(
    //   notificationId: const Uuid().v4(),
    //   title: userModel.name,
    //   accountType: userModel.accountType,
    //   description: description,
    //   notificationTypeEnum: NotificationTypeEnum.message,
    //   senderId: userModel.uid,
    //   senderImage: ref.read(authNotifierCtr).userModel?.profileImage ?? '',
    //   senderName: userModel.name,
    //   receiverId: recieverUser.uid,
    //   date: DateTime.now(),
    // );

    // ref.read(notificationProvider).pushNotificationsDevice(
    //     ref: ref,
    //     context: context,
    //     model: model,
    //     registerIds: [recieverUser.fcmToken]);
  }

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      hideKeyboard();
      showEmojiContainer();
    }
  }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();

  void hideKeyboard() => focusNode.unfocus();

  void selectImageFromCamera() async {
    File? image = await pickChatImageFromGallery(context);
    if (image != null) {
      // sendFileMessage(image, MessageEnum.image);
    }
  }

  // void selectImage() async {
  //   File? image = await pickChatImageFromGallery(context);
  //   if (image != null) {
  //     sendFileMessage(image, MessageEnum.image);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.08)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: selectImageFromCamera,
              child: SvgPicture.asset(AppAssets.attachSvgIcon,
                  height: 24, width: 24),
            ),
            padding12,
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: context.lightGreyColor)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: isRecording ? "Recording..." : "Message",
                          hintStyle: getSemiBoldStyle(
                              color: context.boarderColor.withOpacity(0.64)),
                          border: InputBorder.none,
                        ),
                        enabled: !isRecording,
                        onChanged: (v) {
                          setState(() {});
                        },
                        controller: _messageController,
                      ),
                    ),
                    padding12,
                    SizedBox(
                      width: 10.h,
                    ),
                    isRecording
                        ? GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 16.r,
                              backgroundColor:
                                  context.errorColor.withOpacity(.2),
                              child: Icon(Icons.delete_forever_sharp,
                                  size: 22.r, color: context.errorColor),
                            ),
                          )
                        : const SizedBox(),
                    if (isRecording) padding2,
                    _messageController.text.isNotEmpty || isRecording
                        ? GestureDetector(
                            onTap: sendTextMessage,
                            child: CircleAvatar(
                                radius: 24.r,
                                backgroundColor: context.primary,
                                child: Icon(
                                  Icons.send_rounded,
                                  color: context.whiteColor,
                                )),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 24.r,
                              child: SvgPicture.asset(AppAssets.sendSvgIcon,
                                  height: 18.h, width: 18.w),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
