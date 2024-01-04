import 'package:travel/utilities/exports.dart';

class ReviewRow extends GetView {
  const ReviewRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text("Prasetya Hadi Saputra"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
                3,
                (index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20.sp,
                    )),
          ),
          Text("Wisatanya bagus bersih")
        ],
      ),
      isThreeLine: true,
      trailing: Text("20 Sep 2023"),
    );
  }
}
