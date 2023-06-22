import 'dart:convert';

import 'package:stacked/stacked.dart';

import 'package:flutter/services.dart';

class HomeViewModel extends BaseViewModel {
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);

    print(data);
  }
}
