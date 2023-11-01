import 'dart:math';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel/app/modules/index/views/discover_view.dart';
import 'package:travel/app/modules/index/views/explorer_view.dart';
import 'package:travel/app/modules/index/views/profile_view.dart';
import 'package:travel/app/modules/index/views/search_view.dart';

import '../../../../utilities/exports.dart';

class IndexController extends GetxController {
  //TODO: Implement IndexController

  var switchMaps = false.obs;
  final count = 0.obs;
  var mapController = MapController().obs;
  var viewBottomNav = [
    DiscoverView(),
    ExplorerView(),
    SearchView(),
    ProfileView(),
  ];
  var currentRangeValues = const RangeValues(200, 8000).obs;
  

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  var indexActive = 0.obs;
  activeBottomNav(val) {
    indexActive.value = val;
  }

  switchTravel(val) {
    switchMaps.value = val;
  }

  setMapsFocus() {
    mapController.value.move(LatLng(-6.297309, 106.893019), 14);
  }
}
