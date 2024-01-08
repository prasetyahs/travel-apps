import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel/app/data/model/travel_model.dart';
import 'package:travel/app/modules/index/controllers/index_controller.dart';
import 'package:travel/component/apps_item_row_travel.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/env.dart';
import 'package:travel/utilities/exports.dart';

class ExplorerView extends GetView<IndexController> {
  const ExplorerView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Obx(
          () => !controller.switchMaps.value
              ? Container()
              : FloatingActionButton(
                  backgroundColor: AppsColors.primary(),
                  onPressed: () => controller.setMapsFocus(),
                  child: const Icon(Icons.my_location),
                ),
        ),
        appBar: AppBar(
          title: Text(
            'explorerTravel'.tr,
            style: TextStyle(color: Colors.black, fontSize: 15.sp),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Row(
              children: [
                Obx(
                  () => Text(
                    "${"listSwitch".tr} ${!controller.switchMaps.value ? "Maps" : "List"}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Obx(
                  () => Switch(
                      value: controller.switchMaps.value,
                      activeColor: AppsColors.primary(),
                      onChanged: (v) => controller.switchTravel(v)),
                )
              ],
            )
          ],
        ),
        body: Obx(() => !controller.switchMaps.value
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  TravelModel travelModel =
                      TravelModel.fromJson(controller.myClustering[index]);
                  return AppsItemRowTravel(
                    travelModel: travelModel,
                  );
                },
                itemCount: controller.myClustering.length,
              )
            : Obx(() => FlutterMap(
                  mapController: controller.mapController.value,
                  options: MapOptions(
                    onTap: (post, lat) {
                      Get.back();
                    },
                    initialCenter: LatLng(controller.lat, controller.long),
                    interactionOptions: const InteractionOptions(
                      enableMultiFingerGestureRace: true,
                    ),
                    initialZoom: 14,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://www.google.cn/maps/vt?lyrs=m@207000000&gl=cn&x={x}&y={y}&z={z}',
                      userAgentPackageName: 'com.sinardigi.app',
                    ),
                    PopupMarkerLayer(
                      options: PopupMarkerLayerOptions(
                          markers: controller.myLocation
                              .map((element) => element as Marker)
                              .toList(),
                          popupDisplayOptions: PopupDisplayOptions(
                              builder: (BuildContext context, Marker marker) {
                            int index = (controller.myLocation).indexOf(marker);
                            TravelModel travelModel = TravelModel.fromJson(
                                controller.myClustering[index]);
                            return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Expanded(
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          travelModel.name ?? "",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        Row(
                                          children: List.generate(
                                              travelModel.rating ?? 0,
                                              (index) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 14.sp,
                                                  )),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      travelModel.description ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    leading: travelModel.photos != null &&
                                            travelModel.photos!.isNotEmpty
                                        ? CachedNetworkImage(
                                            width: 80.w,
                                            height: 50.h,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                            imageUrl: Env.IMAGE_URL +
                                                travelModel.photos![0].photo!)
                                        : const Text("Photo Not Found"),
                                  ),
                                ));
                          }),
                          onPopupEvent: (e, marker) {}),
                    ),
                  ],
                ))));
  }
}
