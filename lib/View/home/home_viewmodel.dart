import 'dart:async';
import 'dart:convert';

import 'package:elluminati_project/models/generated.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  Autogenerated? autogenerated;

  int? selectedApartmentValue = 1;
  int facilityIncreaseDecreaseValue = 1;
  int price = 999;

  String? selectedApartmentFacilityId;

  bool shouldShowAppBar = false;

  ScrollController apartmentScrollControl = ScrollController();

  List<Specification> specifications = [];

  HomeViewModel({this.autogenerated}) {
    apartmentScrollControl.addListener(handleScrollControl);
  }

  void handleScrollControl() {
    if (apartmentScrollControl.position.extentBefore > 200) {
      shouldShowAppBar = true;
      notifyListeners();
    } else {
      shouldShowAppBar = false;
      notifyListeners();
    }
  }

  Future<void> readJsonData() async {
    final String response = await rootBundle.loadString('assets/response.json');

    final data = await json.decode(response);
    autogenerated = Autogenerated.fromMap(data);

    if (autogenerated != null) {
      specifications = autogenerated!.specifications.where((element) {
        return element.modifierId == '621da764abb8a52242c181e5';
      }).toList();
    }
    notifyListeners();
  }

  void handleApartmentSizeRadioButtonTap(String id) {
    selectedApartmentFacilityId = id;
    notifyListeners();

    specifications = autogenerated!.specifications.where((element) {
      return element.modifierId == selectedApartmentFacilityId;
    }).toList();
    notifyListeners();
  }
}
