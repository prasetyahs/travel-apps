class AuthModel {
  int? id;
  String? nama;
  String? username;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? role;

  AuthModel(
      {this.id,
      this.nama,
      this.username,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.role});

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    return data;
  }
}
