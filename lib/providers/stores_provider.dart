import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gamesdealsapp/models/store_model.dart';
import 'package:http/http.dart';

class StoresProvider extends ChangeNotifier {
  bool isLoading = true;
  List<StoreModel> stores = [];

  StoresProvider() {
    fetchStores();
  }

  void fetchStores() async {
    Uri requestUri = Uri.parse("https://www.cheapshark.com/api/1.0/stores");
    Response response = await get(requestUri);
    List<dynamic> decoded = jsonDecode(response.body);
    log(decoded.toString());

    stores=decoded.map((storeMap) => StoreModel.fromJson(storeMap)).toList();

    isLoading = false;
    notifyListeners();
  }
}
