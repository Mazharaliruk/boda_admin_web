import 'dart:io';

import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/feature/admin/ai/controller/ai_controller.dart';
import 'package:admin_boda/feature/admin/ai/widgets/custom_dialog.dart';
import 'package:admin_boda/feature/admin/ai/widgets/input_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:share_plus/share_plus.dart';


class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  // final ApiService _apiService = ApiService();
  final FlutterTts flutterTts = FlutterTts();
  final List<Map<String, dynamic>> _messages = [];
  String _message = "";
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  bool showEmojiPicker = false;
  XFile? pickedImage;
  bool scanning = false;
  String text_ocr = '';
  DateTime lastMessageDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _sendMessage() async {
    if (_message.isNotEmpty) {
      final timestamp = DateTime.now();
      setState(() {
        _messages.add({
          'sender': 'user',
          'content': _message,
          'type': 'text',
          'date': timestamp
        });
        _message = "";
        _messageController.clear();
      });
      FocusScope.of(context).unfocus();
      setState(() => showEmojiPicker = false); // Close emoji picker

      // try {
      //   final response = await _apiService.sendMessage(_messageController.text);
      //   setState(() {
      //     _messages.add({
      //       'sender': 'assistant',
      //       'content': response,
      //       'type': 'text',
      //       'date': DateTime.now()
      //     });
      //   });
      // } catch (e) {
      //   if (kDebugMode) {
      //     print(e);
      //   }
      // }
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  String displayTimestamp(DateTime messageDate) {
    final now = DateTime.now();
    final difference = now.difference(messageDate).inMinutes;

    if (difference == 0) return 'Just now';
    if (difference == 1) return '1 minute ago';
    if (difference < 60) return '$difference minutes ago';

    final differenceInDays = now.difference(messageDate).inDays;
    if (differenceInDays == 0) {
      final hour = messageDate.hour;
      final minute = messageDate.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }
    return "${messageDate.year}-${messageDate.month}-${messageDate.day}";
  }

  // Perform text recognition on selected image
  Future<void> performTextRecognition() async {
    setState(() {
      scanning = true;
    });
    try {
      final inputImage = InputImage.fromFilePath(pickedImage!.path);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final recognizedText = await textRecognizer.processImage(inputImage);

      setState(() {
        text_ocr = recognizedText.text;
        _messages.add({
          'sender': 'user',
          'content': pickedImage!.path,
          'type': 'image',
          'date': DateTime.now()
        });
        _messages.add({
          'sender': 'assistant',
          'content': text_ocr,
          'type': 'text',
          'date': DateTime.now()
        });
        scanning = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
    }
  }

  // Open gallery and select an image
  Future<void> get_image(ImageSource source) async {
    try {
      XFile? result = await _imagePicker.pickImage(source: source);
      if (result != null) {
        setState(() {
          pickedImage = result;
        });
        await performTextRecognition();
      }
    } catch (e) {
      String errorMessage = "";
      if (e is PlatformException) {
        errorMessage = "Permission denied to access photos";
      } else if (e is FileSystemException) {
        errorMessage = "Unable to access the selected image";
      } else {
        errorMessage = "Something went wrong while selecting the image";
      }
      Get.snackbar(
        "Image Selection Failed",
        errorMessage,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[900],
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    }
  }

  // Share message content
  void _shareContent(String content) {
    Share.share(content);
  }

  // Speak message content
  Future<void> _speakContent(String content) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(content);
  }

  @override
  Widget build(BuildContext context) {
     final aiController = ref.watch(aiProvider);
    //  aiController.chatComplete();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset('assets/images/bg.png'),
          ),
          SafeArea(
            child: Column(
              children: [
                // const CustomAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    reverse: true,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_messages.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  displayTimestamp(
                                      lastMessageDate), // Display "Just now"
                                 style: const TextStyle(
                                    fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                 ),
                                ),
                              ),
                            ),
                          ],
                          Column(
                            children: _messages.map((msg) {
                              bool isUser = msg['sender'] == 'user';
                              return Align(
                                alignment: isUser
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isUser ? Colors.white : Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        displayTimestamp(msg['date']),
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey[600]),
                                      ),
                                      msg['type'] == 'image'
                                          ? ImageMessage(path: msg['content'])
                                          : Text(
                                           msg['content'] ?? '',
                                           style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              color: isUser
                                                  ? Colors.black
                                                  : Colors.black,
                                           ),
                                            ),
                                      if (!isUser && msg['type'] == 'text')
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () => showCustomDialog(
                                                context,
                                                msg['content'],
                                                () async {
                                                  // final regeneratedText =
                                                  //     await _apiService.modifyText(
                                                  //         msg['content'],
                                                  //         "Please regenerate the following text");
                                                  // setState(() {
                                                  //   msg['content'] =
                                                  //       regeneratedText;
                                                  // });
                                                },
                                                () async {
                                                  // final shortenedText =
                                                  //     await _apiService.modifyText(
                                                  //         msg['content'],
                                                  //         "Please make the following text shorter");
                                                  // setState(() {
                                                  //   msg['content'] =
                                                  //       shortenedText;
                                                  // });
                                                },
                                                () async {
                                                  // final lengthenedText =
                                                  //     await _apiService.modifyText(
                                                  //         msg['content'],
                                                  //         "Please make the following text longer");
                                                  // setState(() {
                                                  //   msg['content'] =
                                                  //       lengthenedText;
                                                  // });
                                                },
                                              ),
                                              child: SvgPicture.asset(
                                                  "assets/icons/reverse.svg"),
                                            ),
                                            const SizedBox(width: 4),
                                            GestureDetector(
                                              onTap: () =>
                                                  _speakContent(msg['content']),
                                              child: SvgPicture.asset(
                                                  "assets/icons/speaker.svg"),
                                            ),
                                            const SizedBox(width: 4),
                                            GestureDetector(
                                              onTap: () =>
                                                  _shareContent(msg['content']),
                                              child: SvgPicture.asset(
                                                  "assets/icons/share.svg"),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 10),
                          if (showEmojiPicker)
                            SizedBox(
                              height: 250,
                              child: EmojiPicker(
                                onEmojiSelected: (category, emoji) {
                                  _messageController.text += emoji.emoji;
                                  setState(() {
                                    _message = _messageController.text;
                                  });
                                },
                              ),
                            ),
                          Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showEmojiPicker = !showEmojiPicker;
                                        FocusScope.of(context).unfocus();
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.13,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/icons/emoji.svg"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {
                                      get_image(ImageSource.gallery);
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width *
                                          0.13,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            "assets/icons/attachment.svg"),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: InputField(
                                      controller: _messageController,
                                      onChanged: (value) {
                                        setState(() {
                                          _message = value;
                                        });
                                      },
                                      onSubmitted: (value) {
                                        _sendMessage();
                                      },
                                      icon: InkWell(
                                        onTap: _sendMessage,
                                        child: SvgPicture.asset(
                                            "assets/icons/send.svg"),
                                      ),
                                      hintText: '',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for displaying an image message
class ImageMessage extends StatelessWidget {
  final String path;
  const ImageMessage({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.file(
        File(path),
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
