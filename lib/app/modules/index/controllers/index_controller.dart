import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:travel/app/data/api_provider.dart';
import 'package:travel/app/data/api_response.dart';
import 'package:travel/app/data/model/auth_model.dart';
import 'package:travel/app/data/model/travel_model.dart';
import 'package:travel/app/data/repository/travel_repository.dart';
import 'package:travel/app/data/repository/user_repository.dart';
import 'package:travel/app/modules/index/views/discover_view.dart';
import 'package:travel/app/modules/index/views/explorer_view.dart';
import 'package:travel/app/modules/index/views/profile_view.dart';
import 'package:travel/app/modules/index/views/search_view.dart';
import 'package:travel/component/apps_item_row_travel.dart';
import 'package:travel/service/location_service.dart';
import 'package:travel/service/storage_service.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/apps_dialog.dart';

import '../../../../utilities/exports.dart';

class IndexController extends GetxController {
  var switchMaps = false.obs;
  final count = 0.obs;
  var mapController = MapController().obs;
  var viewBottomNav = [
    const DiscoverView(),
    const ExplorerView(),
    const SearchView(),
    const ProfileView(),
  ];
  var currentRangeValues = const RangeValues(200, 8000).obs;
  final StorageService storageService;
  final LocationService locationService;
  IndexController(
      {required this.storageService, required this.locationService});
  var listCategory = [].obs;
  var lat = 0.0, long = 0.0;

  //list Observe data
  var myLocation = [].obs;
  var myRecommend = [].obs;
  var myPopular = [].obs;
  var myClustering = [].obs;

  //loading
  var isLoadRecommend = false.obs;
  var isLoadPopular = false.obs;
  var isLoadCategory = false.obs;
  var isLoadClustering = false.obs;
  var isOnEdit = false.obs;
  var markers = [].obs;

  var editProfileForm = List.generate(3, (index) => TextEditingController());

  @override
  void onInit() {
    super.onInit();
    ApiProvider.headers.putIfAbsent("Authorization",
        () => "Bearer ${storageService.readString(key: "token")}");
  }

  @override
  void onReady() {
    super.onReady();
    onGetProfile();
    onLoadLocation();
    onLoadCategory();
    onLoadRecommend();
    onLoadPopular();
    onLoadClustering();
  }

  onLoadLocation() async {
    await locationService.checkLocationPermission().then((value) async {
      await locationService.getCurrentLocation().then((value) {
        lat = value!.latitude;
        long = value.longitude;
        myLocation.add(Marker(
          point: LatLng(lat, long),
          width: 35,
          height: 35,
          child: GestureDetector(
            onTap: () => showBottomSheet(
                context: Get.context!, builder: (context) => Container()),
            child: Icon(
              Icons.my_location,
              size: 35,
              color: AppsColors.primary(),
            ),
          ),
        ));
      });
    });
  }

  void increment() => count.value++;
  var indexActive = 0.obs;
  activeBottomNav(val) {
    indexActive.value = val;
  }

  switchTravel(val) {
    switchMaps.value = val;
  }

  setMapsFocus() async {
    mapController.value.move(LatLng(lat, long), 13);
  }

  onLoadCategory() async {
    isLoadCategory.value = true;
    listCategory.clear();
    await TravelRepository.getCategory().then((value) {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      listCategory.addAll(apiResponse.data);
    }).catchError((err) => null);
    isLoadCategory.value = false;
  }

  onLoadRecommend() async {
    isLoadRecommend.value = true;
    myRecommend.clear();
    await TravelRepository.getTravel(lat: lat, long: long, recommend: 1)
        .then((value) {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      myRecommend.addAll(apiResponse.data);
    });
    isLoadRecommend.value = false;
  }

  onLoadPopular() async {
    isLoadPopular.value = true;
    myPopular.clear();
    await TravelRepository.getTravel(lat: lat, long: long, isPopular: 1)
        .then((value) {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      myPopular.addAll(apiResponse.data);
    });
    isLoadPopular.value = false;
  }

  onLoadClustering() async {
    isLoadClustering.value = true;
    myClustering.clear();
    await TravelRepository.getClustering(lat: lat, long: long, k: 3)
        .then((value) {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      myClustering.addAll(apiResponse.data);
    }).whenComplete(() {
      _setMarkersLocation();
    });
    isLoadClustering.value = false;
  }

  _setMarkersLocation() {
    for (var element in myClustering) {
      TravelModel travelModel = TravelModel.fromJson(element);
      myLocation.add(Marker(
        point: LatLng(
            double.parse(travelModel.lat!), double.parse(travelModel.lon!)),
        width: 35,
        height: 35,
        child: Icon(
          Icons.location_on,
          size: 35,
          color: travelModel.numOfCluster == 0
              ? Colors.redAccent
              : travelModel.numOfCluster == 2
                  ? Colors.amberAccent
                  : Colors.blueAccent,
        ),
      ));
    }
  }

  onGetProfile() {
    try {
      AuthModel authModel =
          AuthModel.fromJson(storageService.read(key: "user"));
      editProfileForm[0].text = authModel.nama!;
      editProfileForm[1].text = authModel.email!;
    } catch (err) {
      return null;
    }
  }

  onEditProfile() async {
    isOnEdit.value = true;
    var body = {
      "name": editProfileForm[0].text.toString(),
      "email": editProfileForm[1].text.toString()
    };
    if (editProfileForm[2].text.isNotEmpty) {
      body['password'] = editProfileForm[2].text.toString();
    }
    await UserRepository.editProfile(body).then((value) {
      ApiResponse apiResponse = ApiResponse.fromJson(value);
      storageService.write(key: "user", value: apiResponse.data);
      AppsDialog.showDialogMessage(
          message: apiResponse.message, status: apiResponse.status);
    }).catchError((err) {
      return null;
    });
    isOnEdit.value = false;
  }

  onSearch() async {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hasil Pencarian",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w700),
                    ),
                    const CloseButton()
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AppsItemRowTravel(travelModel: TravelModel());
                    },
                    itemCount: 2,
                  ),
                )
              ],
            ),
          );
        });
  }
}
