class CategoryModel {
  int? id;
  String? nama;
  String? createdAt;
  String? updatedAt;

  CategoryModel({this.id, this.nama, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
