import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel/utilities/apps_themes.dart';
import 'package:travel/utilities/exports.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await GetStorage.init();
  runApp(ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppsThemes.themeData(),
        title: "Weather Apps",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  ));
}
