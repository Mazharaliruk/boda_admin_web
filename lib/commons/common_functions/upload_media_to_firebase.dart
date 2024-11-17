// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:the_ascension_app/commons/common_widgets/show_toast.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';
// import 'package:video_compress/video_compress.dart';

// Future<String?> uploadImage(
//     {required File img, required String storageFolderName}) async {
//   FirebaseStorage storage = FirebaseStorage.instance;
//   final Uint8List list = await img.readAsBytes();

//   try {
//     String name = const Uuid().v1();
//     Reference ref = storage.ref().child(storageFolderName).child(name);
//     UploadTask task = ref.putData(list);
//     final TaskSnapshot taskSnapshot = await task.whenComplete(() {});
//     final String url = await taskSnapshot.ref.getDownloadURL();
//     return url;
//   } on FirebaseException catch (e) {
//     showToast(msg: e.message ?? '');
//     return null;
//   }
// }

// Future<List<String>> uploadImages(List<XFile> images,
//     {required String storageFolderName}) async {
//   List<String> imgDownloadUrls = [];
//   for (int i = 0; i < images.length; i++) {
//     String imgUrl =
//         await uploadXImage(images[i], storageFolderName: storageFolderName);
//     imgDownloadUrls.add(imgUrl);
//   }
//   return imgDownloadUrls;
// }

// Future<String> uploadXImage(XFile image,
//     {required String storageFolderName}) async {
//   FirebaseStorage storage = FirebaseStorage.instance;
//   var name = const Uuid().v4();
//   final path = storage.ref().child(storageFolderName).child(name);
//   // final path = _storage.ref().child(path);
//   Uint8List imgInBytes = await image.readAsBytes();
//   UploadTask uploadTask = path.putData(imgInBytes);
//   TaskSnapshot snap = await uploadTask.whenComplete(() {});
//   String downloadUrl = await snap.ref.getDownloadURL();
//   return downloadUrl;
// }

// /// upload video to firebase storage

// Future<Map<String, String>> uploadVideo(File video,
//     {required String storageFolderName}) async {
//    const CupertinoActivityIndicator();
//   FirebaseStorage storage = FirebaseStorage.instance;
//   var name = const Uuid().v4();
//   File compressed = await compressFile(video.path);
//   Reference reference = storage.ref().child(storageFolderName).child(name);
//   UploadTask uploadTask = reference.putFile(compressed);
//   await uploadTask.whenComplete(() => print('Video uploaded successfully'));
//   String downloadUrl = await reference.getDownloadURL();
//   String fileNames = '${DateTime.now()}.jpg';
//   Reference references = storage.ref().child(storageFolderName).child('thumbnail/$fileNames');
//   var thumbnail = await references.putFile(await getThumbnail(compressed));
//   String videoThumbnailUrl = await thumbnail.ref.getDownloadURL();
//   return {'videoUrl': downloadUrl, 'thumbnailUrl': videoThumbnailUrl};
// }

// getThumbnail(File videoPath) async {
//   final getthumbnail =
//       await VideoCompress.getFileThumbnail(videoPath.path, quality: 100);
//   return getthumbnail;
// }

// Future<File> compressFile(String videoFilePath) async {
//   final compressedVideo = await VideoCompress.compressVideo(videoFilePath,
//       quality: VideoQuality.MediumQuality);
//   return compressedVideo!.file!;
// }
