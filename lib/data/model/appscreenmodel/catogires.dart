// ignore_for_file: prefer_collection_literals, unnecessary_this

class CatogriesModel {
  int? catId;
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catDatetime;
  String? catUpdateDatetime;

  CatogriesModel(
      {this.catId,
      this.catName,
      this.catNameAr,
      this.catImage,
      this.catDatetime,
      this.catUpdateDatetime});

  CatogriesModel.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDatetime = json['cat_datetime'];
    catUpdateDatetime = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_name_ar'] = this.catNameAr;
    data['cat_image'] = this.catImage;
    data['cat_datetime'] = this.catDatetime;

    data['updated_at'] = this.catUpdateDatetime;
    return data;
  }
}
