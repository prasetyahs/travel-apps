import 'package:get/get.dart';
import 'package:travel/service/storage_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(storageService: StorageService()),
    );
  }
}
