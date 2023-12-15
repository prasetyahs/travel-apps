import 'package:get/get.dart';
import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/service/storage_service.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final StorageService storageService;
  HomeController({required this.storageService});
  @override
  void onInit() {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    if (storageService.read(key: "user").isNotEmpty) {
      await Get.offAllNamed(Routes.INDEX)?.catchError((err) => null);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
