class DealModel {
  String? internalName;
  String? title;
  String? metacriticLink;
  String? dealID;
  String? storeID;
  String? gameID;
  String? salePrice;
  String? normalPrice;
  String? isOnSale;
  String? savings;
  String? metacriticScore;
  String? steamRatingText;
  String? steamRatingPercent;
  String? steamRatingCount;
  String? steamAppID;
  int? releaseDate;
  int? lastChange;
  double? dealRating;
  String? thumb;

  DealModel(
      {this.internalName,
      this.title,
      this.metacriticLink,
      this.dealID,
      this.storeID,
      this.gameID,
      this.salePrice,
      this.normalPrice,
      this.isOnSale,
      this.savings,
      this.metacriticScore,
      this.steamRatingText,
      this.steamRatingPercent,
      this.steamRatingCount,
      this.steamAppID,
      this.releaseDate,
      this.lastChange,
      this.dealRating,
      this.thumb});

  DealModel.fromJson(Map<String, dynamic> json) {
    internalName = json['internalName'];
    title = json['title'];
    metacriticLink = json['metacriticLink'];
    dealID = json['dealID'];
    storeID = json['storeID'];
    gameID = json['gameID'];
    salePrice = json['salePrice'];
    normalPrice = json['normalPrice'];
    isOnSale = json['isOnSale'];
    savings = json['savings'];
    metacriticScore = json['metacriticScore'];
    steamRatingText = json['steamRatingText'];
    steamRatingPercent = json['steamRatingPercent'];
    steamRatingCount = json['steamRatingCount'];
    steamAppID = json['steamAppID'];
    releaseDate = json['releaseDate'];
    lastChange = json['lastChange'];
    dealRating = double.tryParse(json['dealRating']);
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['internalName'] = this.internalName;
    data['title'] = this.title;
    data['metacriticLink'] = this.metacriticLink;
    data['dealID'] = this.dealID;
    data['storeID'] = this.storeID;
    data['gameID'] = this.gameID;
    data['salePrice'] = this.salePrice;
    data['normalPrice'] = this.normalPrice;
    data['isOnSale'] = this.isOnSale;
    data['savings'] = this.savings;
    data['metacriticScore'] = this.metacriticScore;
    data['steamRatingText'] = this.steamRatingText;
    data['steamRatingPercent'] = this.steamRatingPercent;
    data['steamRatingCount'] = this.steamRatingCount;
    data['steamAppID'] = this.steamAppID;
    data['releaseDate'] = this.releaseDate;
    data['lastChange'] = this.lastChange;
    data['dealRating'] = this.dealRating.toString();
    data['thumb'] = this.thumb;
    return data;
  }
}
