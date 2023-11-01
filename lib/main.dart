import 'package:travel/utilities/apps_themes.dart';
import 'package:travel/utilities/exports.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
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
