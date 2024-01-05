import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel/app/data/languages.dart';
import 'package:travel/service/storage_service.dart';
import 'package:travel/utilities/apps_themes.dart';
import 'package:travel/utilities/exports.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await GetStorage.init();
  StorageService storageService = StorageService();
  var lang = storageService.readValue("lang");
  runApp(ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, child) {
      return GetMaterialApp(
        translations: Languages(),
        locale: lang is int
            ? Locale(lang == 0 ? 'en' : 'id', lang == 0 ? 'US' : "ID")
            : Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        theme: AppsThemes.themeData(),
        title: "Weather Apps",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  ));
}
