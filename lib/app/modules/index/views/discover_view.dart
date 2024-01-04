import 'package:lottie/lottie.dart';
import 'package:travel/app/data/model/category_model.dart';
import 'package:travel/app/data/model/travel_model.dart';
import 'package:travel/app/modules/index/controllers/index_controller.dart';
import 'package:travel/component/apps_item_row_travel.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/env.dart';
import 'package:travel/utilities/shimmer_single_container.dart';

import '../../../../utilities/exports.dart';

class DiscoverView extends GetView<IndexController> {
  const DiscoverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Lokasi saat ini",
                style: TextStyle(
                    color: AppsColors.dark(),
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppsColors.primary(),
                  ),
                  Obx(
                    () => Text(
                      controller.locationData.value,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 13.sp),
                    ),
                  )
                ],
              ),
            ],
          ),
          actions: [
            // Container(
            //   width: 35.w,
            //   height: 35.h,
            //   margin: EdgeInsets.only(right: 10.w),
            //   decoration: BoxDecoration(
            //       image: const DecorationImage(
            //           fit: BoxFit.cover,
            //           image: NetworkImage(
            //               "https://i.pinimg.com/736x/38/93/07/389307d6af5c4be0051b7d3c4f93bf3d.jpg")),
            //       shape: BoxShape.circle,
            //       color: AppsColors.primary().withOpacity(0.8)),
            // ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                if (controller.isLoadCategory.value) {
                  return SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return ShimmerSingleContainer(
                            width: 100.w, height: 10.h, paddingHorizontal: 5.w);
                      },
                    ),
                  );
                }
                return SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    shrinkWrap: true, // and set this
                    itemBuilder: (context, index) {
                      CategoryModel categoryModel =
                          controller.listCategory[index];
                      return GestureDetector(
                        onTap: () {},
                        child: CategoryFilter(
                          color:
                              index == 0 ? AppsColors.primary() : Colors.white,
                          textColor:
                              index == 0 ? Colors.white : AppsColors.dark(),
                          title: categoryModel.nama!,
                          marginLeft: index == 0 ? 15.w : 0.0,
                          marginRight: index == 5 ? 20.w : 0.0,
                        ),
                      );
                    },
                    itemCount: controller.listCategory.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rekomendasi Wisata",
                      style: TextStyle(
                          color: AppsColors.dark(),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () => controller.indexActive.value = 1,
                      child: Text(
                        "Selengkapnya",
                        style: TextStyle(
                            color: AppsColors.primary(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  height: 300.h,
                  child: Obx(() {
                    if (controller.isLoadRecommend.value) {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ShimmerSingleContainer(
                                width: 220.w,
                                height: 250.h,
                                paddingHorizontal: 15.w);
                          });
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        TravelModel travelModel =
                            TravelModel.fromJson(controller.myRecommend[index]);
                        return BestPlace(
                          travelModel: travelModel,
                          marginLeft: index == 0 ? 15.w : 0.0,
                          marginRight: index == 5 ? 20.w : 0.0,
                        );
                      },
                      itemCount: controller.myRecommend.length,
                    );
                  })),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Populer Wisata",
                      style: TextStyle(
                          color: AppsColors.dark(),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: () => controller.indexActive.value = 1,
                      child: Text(
                        "Selengkapnya",
                        style: TextStyle(
                            color: AppsColors.primary(),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                if (controller.isLoadPopular.value) {
                  return Column(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: ShimmerSingleContainer(
                                  width: Get.width,
                                  height: 100.h,
                                  paddingHorizontal: 15.w),
                            )),
                  );
                }
                return Column(
                  children: List.generate(controller.myPopular.length, (index) {
                    TravelModel travelModel =
                        TravelModel.fromJson(controller.myPopular[index]);
                    return AppsItemRowTravel(travelModel: travelModel);
                  }),
                );
              })
            ],
          ),
        ));
  }
}

class BestPlace extends GetView {
  final double marginLeft, marginRight;
  final TravelModel travelModel;
  const BestPlace(
      {super.key,
      required this.marginLeft,
      required this.marginRight,
      required this.travelModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Container(
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        width: 200.w,
        height: 250.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: travelModel.photos!.isNotEmpty ? Colors.black : Colors.white,
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                  color: Color.fromRGBO(0, 0, 0, 0.25))
            ],
            image: travelModel.photos!.isNotEmpty
                ? DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        Env.IMAGE_URL + travelModel.photos![0].photo!))
                : null),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              travelModel.photos!.isEmpty
                  ? LottieBuilder.asset(
                      "assets/image_not_found.json",
                      width: 200.w,
                      fit: BoxFit.fill,
                    )
                  : Container(),
              Text(
                travelModel.name ?? "-",
                style: TextStyle(
                    color: travelModel.photos!.isNotEmpty
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 15.sp,
                    letterSpacing: 0.5),
              ),
              Row(
                children: List.generate(
                    travelModel.rating!,
                    (index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20.sp,
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryFilter extends GetView {
  const CategoryFilter({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.marginLeft,
    required this.marginRight,
  });
  final Color color, textColor;
  final String title;
  final double marginLeft, marginRight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                  color: Color.fromRGBO(0, 0, 0, 0.25))
            ]),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 13.sp, fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
