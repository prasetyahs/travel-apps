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
            'Edit Profile',
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                AppsTextField(
                  "Nama",
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
                        "Edit Profil", AppsColors.primary())
                    : const Center(
                        child: CircularProgressIndicator(),
                      ))
              ],
            ),
          ],
        ));
  }
}
