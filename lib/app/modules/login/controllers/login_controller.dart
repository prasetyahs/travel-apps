import 'package:travel/app/data/api_response.dart';
import 'package:travel/app/data/model/auth_model.dart';
import 'package:travel/app/data/repository/auth_repository.dart';
import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/service/storage_service.dart';
import 'package:travel/utilities/apps_dialog.dart';
import 'package:travel/utilities/exports.dart';

class LoginController extends GetxController {
  final StorageService storageService;
  LoginController({required this.storageService});

  final textEditingController =
      List.generate(2, (index) => TextEditingController());
  var isAuth = false.obs;

  onAuth() async {
    isAuth.value = true;
    await AuthRepository.onAuth({
      "email": textEditingController[0].text,
      "password": textEditingController[1].text
    }).then((value) async {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      if (apiResponse.status!) {
        await storageService.write(key: "user", value: apiResponse);
        await Get.offAndToNamed(Routes.INDEX);
        return;
      }
      if (!Get.isSnackbarOpen) {
        AppsDialog.showDialogMessage(
            message: apiResponse.message, status: apiResponse.status);
      }
    });
    isAuth.value = false;
  }
}
