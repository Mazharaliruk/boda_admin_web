import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:admin_boda/commons/common_functions/padding.dart';
import 'package:admin_boda/commons/common_imports/apis_commons.dart';
import 'package:admin_boda/commons/common_imports/common_libs.dart';
import 'package:admin_boda/utils/constants/assets_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideoWidget extends ConsumerStatefulWidget {
  const UploadVideoWidget({
    super.key,
    required this.onVideoSelected,
    required this.title,
    required this.isThumbnail,
  });

  final Function(XFile? videoFile) onVideoSelected;
  final String title;
  final bool isThumbnail;

  @override
  ConsumerState<UploadVideoWidget> createState() => _UploadVideoWidgetState();
}

class _UploadVideoWidgetState extends ConsumerState<UploadVideoWidget> {
  XFile? pickedFile;
  VideoPlayerController? videoController;
  bool _isLoading = false;

  // Platform-specific video initialization
  Future<void> initializeVideoPlayer(XFile file) async {
    try {
      // Dispose of any existing controller
      await videoController?.dispose();

      // Platform-specific initialization
      if (kIsWeb) {
        // For web, use network path
        videoController = VideoPlayerController.networkUrl(
          Uri.parse(file.path),
        );
      } else {
        // For mobile platforms, use file
        videoController = VideoPlayerController.file(
          File(file.path),
        );
      }

      // Initialize the controller
      await videoController?.initialize();
      
      // Additional configuration
      await videoController?.setLooping(true);
      videoController?.play();

      // Update state
      setState(() {
        pickedFile = file;
        _isLoading = false;
      });

      // Callback with selected file
      widget.onVideoSelected(file);
    } catch (e) {
      print('Detailed Video Initialization Error: $e');
      
      // Provide more detailed error feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to initialize video: ${e.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );

      setState(() {
        _isLoading = false;
        videoController = null;
        pickedFile = null;
      });
    }
  }

  // Function to pick a video from the gallery
  Future<void> getVideo() async {
    // Reset previous state
    setState(() {
      _isLoading = true;
      pickedFile = null;
      videoController = null;
    });

    try {
      // Pick a video from the gallery
      final XFile? selectedFile = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
        maxDuration: const Duration(seconds: 60),
      );

      if (selectedFile != null) {
        // Initialize video player
        await initializeVideoPlayer(selectedFile);
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Video Picking Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking video: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
      
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: _isLoading ? null : getVideo,
      child: DottedBorder(
        color: context.primary,
        strokeWidth: 1,
        borderType: BorderType.RRect,
        radius: Radius.circular(4.r),
        dashPattern: const [6, 6],
        child: SizedBox(
          height: 200,
          width: 360,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : pickedFile != null && videoController != null
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: videoController!.value.aspectRatio,
                          child: VideoPlayer(videoController!),
                        ),
                        Positioned(
                          child: IconButton(
                            iconSize: 50,
                            icon: Icon(
                              videoController!.value.isPlaying
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (videoController!.value.isPlaying) {
                                  videoController!.pause();
                                } else {
                                  videoController!.play();
                                }
                              });
                            },
                          ),
                        ),
                      ],
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