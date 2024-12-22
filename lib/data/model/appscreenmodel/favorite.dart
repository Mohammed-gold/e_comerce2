class favoritemodel {
  int? favId;
  int? favUserid;
  int? favItemsid;
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
  int? id;

  favoritemodel(
      {this.favId,
      this.favUserid,
      this.favItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescreption,
      this.itemsDescreptionAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsActive,
      this.itemsCat,
      this.id});

  favoritemodel.fromJson(Map<String, dynamic> json) {
    favId = json['fav_id'];
    favUserid = json['fav_userid'];
    favItemsid = json['fav_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['Items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescreption = json['items_descreption'];
    itemsDescreptionAr = json['items_descreption_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsActive = json['items_active'];
    itemsCat = json['items_cat'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fav_id'] = this.favId;
    data['fav_userid'] = this.favUserid;
    data['fav_itemsid'] = this.favItemsid;
    data['items_id'] = this.itemsId;
    data['Items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_descreption'] = this.itemsDescreption;
    data['items_descreption_ar'] = this.itemsDescreptionAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetime'] = this.itemsDatetime;
    data['items_active'] = this.itemsActive;
    data['items_cat'] = this.itemsCat;
    data['id'] = this.id;
    return data;
  }
}
