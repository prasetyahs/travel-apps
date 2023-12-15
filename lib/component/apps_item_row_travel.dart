import 'package:lottie/lottie.dart';
import 'package:travel/app/data/model/travel_model.dart';
import 'package:travel/utilities/apps_colors.dart';

import '../utilities/exports.dart';

class AppsItemRowTravel extends GetView {
  const AppsItemRowTravel({super.key, required this.travelModel});
  final TravelModel travelModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h, left: 20.w, right: 20.w, top: 5.h),
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
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/keong.jpg"))),
                  )
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
                        travelModel.rating!,
                        (index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.sp,
                            )),
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
    );
  }
}
