import 'package:get/get.dart';
import 'package:travel/service/location_service.dart';
import 'package:travel/service/storage_service.dart';

import '../controllers/index_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(
      () => IndexController(
          storageService: StorageService(), locationService: LocationService()),
    );
  }
}
