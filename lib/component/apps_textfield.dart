import '../utilities/exports.dart';

class AppsTextField extends GetWidget {
  const AppsTextField(this.hint,
      {super.key,
      required this.textEditingController,
      this.suffixIcon,
      this.obsecureText = false,
      this.hint2 = "",
      this.textInputType = TextInputType.text});
  final String hint, hint2;
  final TextEditingController textEditingController;
  final dynamic suffixIcon;
  final bool obsecureText;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              hint,
              style: TextStyle(fontSize: 12.sp),
            )),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: TextFormField(
            style: TextStyle(fontSize: 13.sp),
            controller: textEditingController,
            obscureText: obsecureText,
            keyboardType: textInputType,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 13.sp),
                hintText: hint2),
          ),
        ),
      ],
    );
  }
}
