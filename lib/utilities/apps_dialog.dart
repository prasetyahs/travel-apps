import 'package:travel/utilities/apps_colors.dart';

import 'exports.dart';

class AppsDialog {
  static showDialogMessage({message, status}) =>
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: status ? AppsColors.good() : Colors.red,
      ));
}
