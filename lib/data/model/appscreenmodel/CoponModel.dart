class CoponModel {
  int? coponId;
  String? coponName;
  int? coponDiscount;
  String? date;
  int? coponCount;

  CoponModel(
      {this.coponId,
      this.coponName,
      this.coponDiscount,
      this.date,
      this.coponCount});

  CoponModel.fromJson(Map<String, dynamic> json) {
    coponId = json['Copon_id'];
    coponName = json['Copon_name'];
    coponDiscount = json['Copon_discount'];
    date = json['date'];
    coponCount = json['Copon_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Copon_id'] = this.coponId;
    data['Copon_name'] = this.coponName;
    data['Copon_discount'] = this.coponDiscount;
    data['date'] = this.date;
    data['Copon_count'] = this.coponCount;
    return data;
  }
}
