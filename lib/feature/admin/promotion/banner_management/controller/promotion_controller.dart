

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:admin_boda/data/repositories/inventry/promotion_repository.dart';

import '../../../../../commons/common_imports/apis_commons.dart';
import '../../../../../commons/common_imports/common_libs.dart';
import '../../../../../models/inventry/promotion_model.dart';
final promotionProvider = ChangeNotifierProvider((ref) => PromotionController());
class PromotionController  extends ChangeNotifier{
  
final _promotionRepo = PromotionRepository();




  // fetch categories



  Future<List<PromotionModel>> fetchPromotion() async {
    return await _promotionRepo.fetchPromotion();
  }


  Future<void> updatePromotion(PromotionModel data) async {
     await _promotionRepo.updatePromotion(data);
  }

  Future<void> createPromotion(Map<String, dynamic> data, String fieldName, [File? imageFile])async{
    _promotionRepo.createPromotion(data ,fieldName, imageFile);
  }

  Future<void> createTextPromotion(Map<String, dynamic> data)async{
    _promotionRepo.createTextPromotion(data);
  }

  void handlePromotionCreation(File pickedFile) async {
  // Determine the file type based on its extension
  String fileExtension = path.extension(pickedFile.path).toLowerCase();
  
  // Map the field name based on the file type
  String fileFieldName;
  if (['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp'].contains(fileExtension)) {
    fileFieldName = 'image_url'; // Field for image uploads
  } else if (['.mp4', '.avi', '.mov', '.wmv', '.flv', '.mkv', '.webm'].contains(fileExtension)) {
    fileFieldName = 'video_url'; // Field for video uploads
  } else {
    print('Unsupported file type: $fileExtension');
    return; // Exit if the file type is unsupported
  }

  // Call the createPromotion method
  try {
    await createPromotion({
      "name": "Promotion",
    },fileFieldName, pickedFile);

    print('Promotion created successfully!');
  } catch (e) {
    print('Error creating promotion: $e');
  }
}
}