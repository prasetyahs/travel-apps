import 'package:flutter_svg/svg.dart';
import 'package:travel/app/modules/registration/controllers/registration_controller.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/component/apps_textfield.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: <Widget>[
              SvgPicture.asset(
                "assets/background.svg",
                fit: BoxFit.cover,
                width: Get.width,
              ),
              Positioned(
                top: 25.h,
                left: 10.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButton(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        "signUp".tr,
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 0.5),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 120.h,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: Get.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "welcome".tr,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "registerDesc".tr,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AppsTextField(
                      "name".tr,
                      textEditingController: controller.nameController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppsTextField(
                      "Email",
                      textEditingController: controller.emailController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppsTextField(
                      "Password",
                      textEditingController: controller.passwordController,
                      obsecureText: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "haveAccount".tr,
                          style: TextStyle(
                              color: AppsColors.primary(), fontSize: 13.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() => !controller.isLoading.value
                        ? AppsButton.normalButton(() => controller.onRegister(),
                            "signUp".tr, AppsColors.primary())
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
