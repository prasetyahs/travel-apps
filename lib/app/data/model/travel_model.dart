class TravelModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? city;
  String? lat;
  String? lon;
  Category? category;
  String? createdAt;
  String? updatedAt;
  dynamic distance;
  dynamic rating;
  List<Photos>? photos;
  List<Ratings>? ratings;
  int? totalReview;
  dynamic numOfCluster;
  TravelModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.city,
      this.lat,
      this.lon,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.distance,
      this.photos,
      this.rating,
      this.totalReview,
      this.numOfCluster,
      this.ratings});

  TravelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    city = json['city'];
    lat = json['lat'];
    numOfCluster = json['num_of_cluster'];
    lon = json['lon'];
    totalReview = json['total_review'];
    rating = json['rating'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rating'] = rating;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['city'] = city;
    data['lat'] = lat;
    data['num_of_cluster'] = numOfCluster;
    data['total_review'] = totalReview;
    data['lon'] = lon;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['distance'] = distance;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? nama;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.nama, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
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

class Photos {
  int? id;
  String? photo;
  int? travel;
  dynamic createdAt;
  dynamic updatedAt;

  Photos({this.id, this.photo, this.travel, this.createdAt, this.updatedAt});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    travel = json['travel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['travel'] = travel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Ratings {
  int? id;
  int? userId;
  int? travel;
  String? comments;
  String? numOfRating;
  String? createdAt;
  String? updatedAt;

  Ratings(
      {this.id,
      this.userId,
      this.travel,
      this.comments,
      this.numOfRating,
      this.createdAt,
      this.updatedAt});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    travel = json['travel'];
    comments = json['comments'];
    numOfRating = json['num_of_rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['travel'] = travel;
    data['comments'] = comments;
    data['num_of_rating'] = numOfRating;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
