import 'package:travel/app/modules/index/controllers/index_controller.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/component/apps_textfield.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/exports.dart';

class SearchView extends GetView<IndexController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cari Wisata',
          style: TextStyle(color: Colors.black, fontSize: 15.sp),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppsTextField(
            "Kota",
            textEditingController: TextEditingController(),
            suffixIcon: Icon(
              Icons.my_location,
              color: AppsColors.dark(),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          AppsTextField(
            "Kategori",
            textEditingController: TextEditingController(),
            suffixIcon: Icon(
              Icons.category,
              color: AppsColors.dark(),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Range Harga",
                style: TextStyle(fontSize: 12.sp),
              )),
          Obx(() => RangeSlider(
                activeColor: AppsColors.primary(),
                inactiveColor: AppsColors.primary().withOpacity(0.3),
                values: controller.currentRangeValues.value,
                max: 8000,
                divisions: 10,
                labels: RangeLabels(
                  controller.currentRangeValues.value.start.round().toString(),
                  controller.currentRangeValues.value.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  controller.currentRangeValues.value = values;
                },
              )),
          SizedBox(
            height: 10.h,
          ),
          AppsButton.normalButton(() => controller.onSearch(),
              "Cari Berdasarkan", AppsColors.primary()),
        ],
      ),
    );
  }
}
