import 'dart:ffi';

import 'package:country_flags/country_flags.dart';
import 'package:travel/app/modules/index/controllers/index_controller.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/component/apps_textfield.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';

class ProfileView extends GetView<IndexController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'profileEdit'.tr,
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            AppsTextField(
              "name".tr,
              textEditingController: controller.editProfileForm[0],
            ),
            SizedBox(
              height: 10.h,
            ),
            AppsTextField(
              "Email",
              textEditingController: controller.editProfileForm[1],
            ),
            SizedBox(
              height: 10.h,
            ),
            AppsTextField(
              "Password",
              textEditingController: controller.editProfileForm[2],
              obsecureText: true,
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => !controller.isOnEdit.value
                ? AppsButton.normalButton(() => controller.onEditProfile(),
                    "profileEdit".tr, AppsColors.primary())
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
            SizedBox(
              height: 10.h,
            ),
            AppsButton.normalButton(
                () => controller.logout(), "logout".tr, Colors.redAccent),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => DropdownButton<int>(
                    value: controller.selectLanguage.value,
                    isExpanded: false,
                    onChanged: (int? value) {
                      controller.setLanguage(value);
                    },
                    items: controller.language
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CountryFlag.fromCountryCode(
                              value == 0 ? 'US' : "ID",
                              height: 30,
                              width: 30,
                              borderRadius: 8,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(value == 0 ? "English" : "Indonesia"),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
