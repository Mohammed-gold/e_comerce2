// ignore_for_file: camel_case_types, prefer_collection_literals, unnecessary_new, unnecessary_this

class itemsmodel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescreption;
  String? itemsDescreptionAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDatetime;
  int? itemsActive;
  int? itemsCat;
  int? catId;
  String? catName;
  String? catNameAr;
  String? catImage;
  String? catDatetime;
  int? items_pr_discount;
  int? favorite;
  // var itemsCat;
  itemsmodel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.items_pr_discount,
      this.itemsDescreption,
      this.itemsDescreptionAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsActive,
      this.itemsCat,
      this.catId,
      this.catName,
      this.catNameAr,
      this.catImage,
      this.catDatetime,
      this.favorite});

  itemsmodel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['Items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescreption = json['items_descreption'];
    itemsDescreptionAr = json['items_descreption_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    items_pr_discount = json['items_P_d'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsActive = json['items_active'];
    itemsCat = json['items_cat'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    catNameAr = json['cat_name_ar'];
    catImage = json['cat_image'];
    catDatetime = json['cat_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['Items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_descreption'] = this.itemsDescreption;
    data['items_descreption_ar'] = this.itemsDescreptionAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_price'] = this.itemsPrice;
    data['items_P_d'] = this.items_pr_discount;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetime'] = this.itemsDatetime;
    data['items_active'] = this.itemsActive;
    data['items_cat'] = this.itemsCat;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['cat_name_ar'] = this.catNameAr;
    data['cat_image'] = this.catImage;
    data['cat_datetime'] = this.catDatetime;
    data['favorite'] = this.favorite;
    return data;
  }
}
