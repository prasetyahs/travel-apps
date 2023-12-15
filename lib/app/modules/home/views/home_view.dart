import 'package:flutter_svg/svg.dart';

import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsColors.primary(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icon_login.svg",
            width: Get.width,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Selamat Datang",
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Berbagi lokasi tempat travel yang ingin anda kunjungi.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppsButton.normalButton(
              () => Get.toNamed(Routes.LOGIN), "Lanjutkan", Colors.white,
              fontColor: Colors.black),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
