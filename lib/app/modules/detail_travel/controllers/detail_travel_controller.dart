import 'package:get/get.dart';
import 'package:travel/app/data/model/travel_model.dart';

class DetailTravelController extends GetxController {
  var travelModel = TravelModel().obs;
  @override
  void onReady() {
    super.onReady();
    travelModel.value = Get.arguments['travel'];
  }
}
