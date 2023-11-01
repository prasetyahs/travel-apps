import 'package:travel/utilities/apps_colors.dart';

import '../utilities/exports.dart';

class AppsItemRowTravel extends GetView {
  const AppsItemRowTravel({super.key});

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
          children: [
            Container(
              width: 80.w,
              height: 90.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/keong.jpg"))),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Taman Mini Indonesia Indah",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppsColors.dark(),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5),
                  ),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20.sp,
                            )),
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard \n dummy text ever since the 1500s",
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
