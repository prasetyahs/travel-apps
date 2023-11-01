import 'package:flutter_svg/svg.dart';
import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/component/apps_textfield.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
                        "Sign In",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "Selamat Datang",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Text(
                      "Silahkan login untuk melanjutkan.",
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  AppsTextField(
                    "Email",
                    textEditingController: TextEditingController(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppsTextField(
                    "Password",
                    textEditingController: TextEditingController(),
                    obsecureText: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Lupa Password ?",
                          style: TextStyle(
                              color: AppsColors.primary(), fontSize: 13.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.REGISTRATION),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Text(
                            "Daftar Akun",
                            style: TextStyle(
                                color: AppsColors.primary(), fontSize: 13.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  AppsButton.normalButton(()=>Get.toNamed(Routes.INDEX), "Masuk", AppsColors.primary())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
