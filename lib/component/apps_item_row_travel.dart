import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:travel/app/data/model/travel_model.dart';
import 'package:travel/app/routes/app_pages.dart';
import 'package:travel/utilities/apps_colors.dart';
import 'package:travel/utilities/env.dart';

import '../utilities/exports.dart';

class AppsItemRowTravel extends GetView {
  const AppsItemRowTravel({super.key, required this.travelModel});
  final TravelModel travelModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.DETAIL_TRAVEL, arguments: {"travel": travelModel}),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: 5.h, left: 20.w, right: 20.w, top: 5.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 0),
                color: Color.fromRGBO(0, 0, 0, 0.25))
          ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              travelModel.photos != null && travelModel.photos!.isNotEmpty
                  ? Container(
                      width: 80.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(Env.IMAGE_URL +
                                  travelModel.photos![0].photo!))),
                    )
                  // ?
                  : LottieBuilder.asset(
                      "assets/image_not_found.json",
                      width: 80.w,
                    ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      travelModel.name!,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: AppsColors.dark(),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5),
                    ),
                    Row(
                      children: List.generate(
                          travelModel.rating ?? 0,
                          (index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.sp,
                              )),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Rp. ${travelModel.price}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      travelModel.description!,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
