import 'package:travel/app/data/model/category_model.dart';
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
          'searchTravel'.tr,
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
            "city".tr,
            textEditingController: controller.searchForm[0],
            suffixIcon: Icon(
              Icons.my_location,
              color: AppsColors.dark(),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "category".tr,
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Obx(() {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<CategoryModel>(
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    underline: const SizedBox(),
                    value: controller.selectCategory.value.nama != null
                        ? controller.selectCategory.value
                        : controller.listCategory.first,
                    items: controller.listCategory
                        .map<DropdownMenuItem<CategoryModel>>((element) {
                      return DropdownMenuItem(
                        value: element,
                        child: Text(
                          element.nama!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (CategoryModel? v) {
                      controller.selectCategory.value = v!;
                    }),
              ),
            );
          }),
          SizedBox(
            height: 20.h,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "price".tr,
                style: TextStyle(fontSize: 12.sp),
              )),
          Obx(() => RangeSlider(
                activeColor: AppsColors.primary(),
                inactiveColor: AppsColors.primary().withOpacity(0.3),
                values: controller.currentRangeValues.value,
                max: controller.maxPrice.value.toDouble(),
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
          Obx(() => !controller.onLoadSearch.value
              ? AppsButton.normalButton(() => controller.onSearch(),
                  "searchBy".tr, AppsColors.primary())
              : const Center(
                  child: CircularProgressIndicator(),
                ))
        ],
      ),
    );
  }
}
