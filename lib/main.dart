import 'package:antarjak/provider/dashboard_providers.dart';
import 'package:antarjak/views/dashboard/dashboard_view.dart';
import 'package:antarjak/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (bc) => dashboardProviders()),
        ChangeNotifierProvider(create: (bc) => BeritaLoadDataProvider()),
      ],
      builder: (context, Widget) {
        return MaterialApp(home: LoginView());
      }));
}
