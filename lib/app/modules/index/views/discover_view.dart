import 'package:travel/component/apps_item_row_travel.dart';
import 'package:travel/utilities/apps_colors.dart';

import '../../../../utilities/exports.dart';

class DiscoverView extends GetView {
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
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppsColors.primary(),
                  ),
                  Text(
                    "Jakarta Timur,DKI Jakarta",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 13.sp),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Container(
              width: 35.w,
              height: 35.h,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://i.pinimg.com/736x/38/93/07/389307d6af5c4be0051b7d3c4f93bf3d.jpg")),
                  shape: BoxShape.circle,
                  color: AppsColors.primary().withOpacity(0.8)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 45.h,
                child: ListView.builder(
                  shrinkWrap: true, // and set this
                  itemBuilder: (context, index) {
                    return CategoryFilter(
                      color: index == 0 ? AppsColors.primary() : Colors.white,
                      textColor: index == 0 ? Colors.white : AppsColors.dark(),
                      title: index == 0 ? "Semua" : "Wisata Bahari",
                      marginLeft: index == 0 ? 15.w : 0.0,
                      marginRight: index == 5 ? 20.w : 0.0,
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              ),
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
                    Text(
                      "Selengkapnya",
                      style: TextStyle(
                          color: AppsColors.primary(),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BestPlace(
                      marginLeft: index == 0 ? 15.w : 0.0,
                      marginRight: index == 5 ? 20.w : 0.0,
                    );
                  },
                  itemCount: 5,
                ),
              ),
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
                    Text(
                      "Selengkapnya",
                      style: TextStyle(
                          color: AppsColors.primary(),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children:
                    List.generate(3, (index) => const AppsItemRowTravel()),
              )
            ],
          ),
        ));
  }
}

class BestPlace extends GetView {
  final double marginLeft, marginRight;

  const BestPlace(
      {super.key, required this.marginLeft, required this.marginRight});

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
            boxShadow: const [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 0),
                  color: Color.fromRGBO(0, 0, 0, 0.25))
            ],
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/keong.jpg"))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Taman Mini Indonesia Indah",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
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
