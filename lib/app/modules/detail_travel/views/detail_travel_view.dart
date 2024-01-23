import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/component/apps_button.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/env.dart';
import 'package:travel/utilities/exports.dart';
import '../controllers/detail_travel_controller.dart';
import 'package:map_launcher/map_launcher.dart';

class DetailTravelView extends GetView<DetailTravelController> {
  const DetailTravelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Obx(
          () => controller.travelModel.value.photos != null &&
                  controller.travelModel.value.photos!.isNotEmpty
              ? CarouselSlider(
                  options: CarouselOptions(
                    height: 300.h,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                  ),
                  items: controller.travelModel.value.photos?.map((val) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      Env.IMAGE_URL + val.photo!),
                                  fit: BoxFit.cover)),
                        );
                      },
                    );
                  }).toList(),
                )
              : LottieBuilder.asset(
                  "assets/image_not_found.json",
                  width: 500.w,
                  fit: BoxFit.cover,
                ),
        ),
        Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: false,
            automaticallyImplyLeading: false,
            leadingWidth: 50.w,
            leading: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const BackButton(
                  color: Colors.black,
                )),
          ),
        ),
        DraggableScrollableSheet(
            snap: true,
            initialChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.travelModel.value.name ?? "-",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: AppsColors.primary(),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    controller.travelModel.value.city ?? "-",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                      color: AppsColors.primary(),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    controller
                                            .travelModel.value.category!.nama ??
                                        "-",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: List.generate(
                                      controller
                                          .travelModel.value.ratings!.length,
                                      (index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20.sp,
                                          )),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  child: Text(
                                    "Rp.${controller.travelModel.value.price}",
                                    style: TextStyle(
                                        fontSize: 13.sp, color: Colors.black,fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text("Deskripsi",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              controller.travelModel.value.description!,
                              textAlign: TextAlign.justify,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: AppsButton.normalButton(() async {
                final availableMaps = await MapLauncher.installedMaps;
                if (availableMaps.isNotEmpty) {
                  await MapLauncher.showMarker(
                    mapType: MapType.google,
                    coords: Coords(
                        double.parse(controller.travelModel.value.lat!),
                        double.parse(controller.travelModel.value.lon!)),
                    title: controller.travelModel.value.name!,
                    description: controller.travelModel.value.description,
                  );
                }
              }, "Dapatkan Petunjuk Arah", AppsColors.primary()),
            )),
      ],
    ));
  }
}
