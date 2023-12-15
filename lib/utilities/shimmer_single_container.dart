import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSingleContainer extends StatelessWidget {
  const ShimmerSingleContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.paddingHorizontal});
  final double width, height;
  final double paddingHorizontal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Shimmer.fromColors(
          baseColor: const Color.fromRGBO(235, 235, 235, 1),
          highlightColor: const Color.fromRGBO(241, 241, 241, 1),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width,
            height: 100.h,
          )),
    );
  }
}
