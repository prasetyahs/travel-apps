import 'package:get/get.dart';

import '../controllers/detail_travel_controller.dart';

class DetailTravelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTravelController>(
      () => DetailTravelController(),
    );
  }
}
