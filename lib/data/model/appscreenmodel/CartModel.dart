class CartModel {
  int? cartItemsPrice;
  int? itemscount;
  int? cartId;
  int? cartItemsId;
  int? cartUserId;
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

  CartModel(
      {this.cartItemsPrice,
      this.itemscount,
      this.cartId,
      this.cartItemsId,
      this.cartUserId,
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
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartItemsPrice = json['cartItemsPrice'];
    itemscount = json['itemscount'];
    cartId = json['cart_id'];
    cartItemsId = json['cart_items_id'];
    cartUserId = json['cart_user_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemsPrice'] = this.cartItemsPrice;
    data['itemscount'] = this.itemscount;
    data['cart_id'] = this.cartId;
    data['cart_items_id'] = this.cartItemsId;
    data['cart_user_id'] = this.cartUserId;
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
    return data;
  }
}
