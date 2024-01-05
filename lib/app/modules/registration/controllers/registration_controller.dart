import 'package:get/get.dart';
import 'package:travel/app/data/api_response.dart';
import 'package:travel/app/data/repository/auth_repository.dart';
import 'package:travel/utilities/apps_dialog.dart';
import 'package:travel/utilities/exports.dart';

class RegistrationController extends GetxController {
  //TODO: Implement RegistrationController

  final count = 0.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onRegister() async {
    isLoading.value = true;
    await AuthRepository.onRegister({
      "nama": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      AppsDialog.showDialogMessage(
          message: apiResponse.message, status: apiResponse.status);
    });
    isLoading.value = false;
  }
}
