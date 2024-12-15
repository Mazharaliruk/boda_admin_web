

import 'dart:io';

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

  Future<void> createPromotion(Map<String, dynamic> data, [File? imageFile])async{
    _promotionRepo.createPromotion(data , imageFile);
  }
}