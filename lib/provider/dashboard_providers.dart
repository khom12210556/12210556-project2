import 'dart:convert';

import 'package:antarjak/models/berita_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dashboardProviders with ChangeNotifier {
  int tabaktif = 0;

  void UbahTab(int index) {
    tabaktif = index;
    notifyListeners();
  }
}

class BeritaLoadDataProvider with ChangeNotifier {
  List<BeritaModel> data = [];

  Future refresh() async {
    final alamat =
        'http://api.mediastack.com/v1/news?access_key=1c8c3524bf0c7714aaa5da8f149a0ec8';
    final hasil = await http.get(Uri.parse(alamat));
    if (hasil.statusCode != 200) return [];

    final obj = jsonDecode(hasil.body);

    data.clear();
    for (var n in obj['data']) {
      data.add(BeritaModel.fromMap(n));
    }
    notifyListeners();
  }
}
