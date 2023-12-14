class ApiResponse {
  dynamic data;
  String? message;
  bool? status;
  String? token;

  ApiResponse({this.data, this.message, this.status, this.token});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    data['token'] = token;
    return data;
  }
}
