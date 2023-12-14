import 'package:get/get.dart';
import 'package:travel/service/storage_service.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        storageService: StorageService(),
      ),
    );
  }
}
