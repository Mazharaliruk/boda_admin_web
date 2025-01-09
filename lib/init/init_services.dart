
import '../services/category_service.dart';

class InitServices {
  static Future<void> init() async {
    await CategoryService().init();  // Ensure the init method is called
  }
}