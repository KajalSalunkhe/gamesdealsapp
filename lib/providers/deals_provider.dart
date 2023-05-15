import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gamesdealsapp/models/deal_model.dart';
import 'package:gamesdealsapp/models/store_model.dart';
import 'package:http/http.dart';

class DealsProvider extends ChangeNotifier {
  bool isLoding = true;
  List<DealModel> deals = [];

  // DealsProvider(){
  //   fetchDeals(store)
  // }

  setloading(bool value) {
    isLoding = value;
    notifyListeners();
  }

  void fetchDeals(StoreModel store) async {
    setloading(true);

    Uri requestUri = Uri.parse(
        "https://www.cheapshark.com/api/1.0/deals?storeID=${store.storeID}");
    Response response = await get(requestUri);
    List<dynamic> decoded = jsonDecode(response.body);

    log(decoded.toString());

    deals = decoded.map((dealMap) => DealModel.fromJson(dealMap)).toList();
    setloading(false);
  }
}
