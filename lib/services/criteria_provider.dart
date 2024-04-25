import 'dart:convert';
import 'dart:developer';

import 'package:fitpage_challenge/constant/constant.dart';
import 'package:fitpage_challenge/model/criteria_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CriteriaDataProvider extends ChangeNotifier {
  List<CriteriaDataModel> _data = [];

  List<CriteriaDataModel> get data => _data;

  Future<void> fetchCriteriaData() async {
    try {
      final response = await http.get(Uri.parse(criteriaUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        _data =
            jsonData.map((json) => CriteriaDataModel.fromJson(json)).toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log('Error fetching data: $e');
      rethrow;
    }
  }
}
