import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/component/apps_textfield.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';

class ProfileView extends GetView {
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
                  textEditingController: TextEditingController(),
                ),
                SizedBox(
                  height: 10.h,
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
                AppsButton.normalButton(
                    () {}, "Edit Profil", AppsColors.primary())
              ],
            ),
          ],
        ));
  }
}
