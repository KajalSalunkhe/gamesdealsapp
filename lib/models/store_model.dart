class StoreModel {
  String? storeID;
  String? storeName;
  int? isActive;
  Images? images;

  StoreModel({this.storeID, this.storeName, this.isActive, this.images});

  StoreModel.fromJson(Map<String, dynamic> json) {
    storeID = json['storeID'];
    storeName = json['storeName'];
    isActive = json['isActive'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeID'] = this.storeID;
    data['storeName'] = this.storeName;
    data['isActive'] = this.isActive;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}

class Images {
  String? banner;
  String? logo;
  String? icon;

  Images({this.banner, this.logo, this.icon});

  Images.fromJson(Map<String, dynamic> json) {
    banner = json['banner'];
    logo = json['logo'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner'] = this.banner;
    data['logo'] = this.logo;
    data['icon'] = this.icon;
    return data;
  }
}
