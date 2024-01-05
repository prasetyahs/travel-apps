import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';
import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: Color(0x3E000000),
                  offset: Offset(0, 0),
                  blurRadius: 8,
                  spreadRadius: 1)
            ], borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: SalomonBottomBar(
              currentIndex: controller.indexActive.value,
              onTap: (index) {
                controller.activeBottomNav(index);
              },
              items: [
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 23.sp,
                  ),
                  title: Text("discover".tr),
                  selectedColor: AppsColors.primary(),
                  unselectedColor: AppsColors.dark(),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.map_outlined,
                    size: 23.sp,
                  ),
                  title: Text(
                    "explore".tr,
                  ),
                  unselectedColor: AppsColors.dark(),
                  selectedColor: AppsColors.primary(),
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 23.sp,
                  ),
                  title: Text("search".tr),
                  unselectedColor: AppsColors.dark(),
                  selectedColor: AppsColors.primary(),
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    size: 23.sp,
                  ),
                  title: Text("profile".tr),
                  unselectedColor: AppsColors.dark(),
                  selectedColor: AppsColors.primary(),
                ),
              ],
            ),
          ),
        ),
        body:
            Obx(() => controller.viewBottomNav[controller.indexActive.value]));
  }
}
