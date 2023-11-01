import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel/app/modules/index/controllers/index_controller.dart';
import 'package:travel/component/apps_item_row_travel.dart';
import 'package:travel/utilities/apps_colors.dart';
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
            'Eksplor Wisata',
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
                    "Ganti ${!controller.switchMaps.value ? "Maps" : "List"}",
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
                itemBuilder: (context, index) {
                  return const AppsItemRowTravel();
                },
                itemCount: 10,
              )
            : FlutterMap(
                mapController: controller.mapController.value,
                options: MapOptions(
                  onTap: (post, lat) {
                    print(lat);
                  },
                  initialCenter: LatLng(-6.253919, 106.919901),
                  interactionOptions: InteractionOptions(
                    enableMultiFingerGestureRace: true,
                  ),
                  initialZoom: 14,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.syncode.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: const LatLng(-6.253919, 106.919901),
                        width: 35,
                        height: 35,
                        child: GestureDetector(
                          onTap: () => print("TAPPING"),
                          child: Icon(
                            Icons.location_pin,
                            size: 35,
                            color: AppsColors.primary(),
                          ),
                        ),
                      ),
                      Marker(
                        point: const LatLng(-6.297309, 106.893019),
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.location_pin,
                          size: 35,
                          color: AppsColors.primary(),
                        ),
                      ),
                    ],
                  ),
                ],
              )));
  }
}
