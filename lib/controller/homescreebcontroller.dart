import 'dart:convert';

import 'package:api_using_provider/model/newAPI_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homescreenController with ChangeNotifier {
  NewApiModel? resmodel;
  bool isLoading = false;
  Future getData() async {
    isLoading = true;
    notifyListeners();
    // step 1

    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=4ef7078908b548e283f2c1344627d0eb");

    // step2
    var res = await http.get(url);

    // step 3

    if (res.statusCode == 200) {
      // Step4= decode
      var decodedData = jsonDecode(res.body);

      //step=5 convert to modelclass

      resmodel = NewApiModel.fromJson(decodedData);

      // step 6 -state update
    } else {
      print("failed");
    }
    isLoading = false;
    notifyListeners();
  }
}
