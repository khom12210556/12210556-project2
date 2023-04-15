import 'package:antarjak/provider/dashboard_providers.dart';
import 'package:antarjak/views/dashboard/beranda_panel.dart';
import 'package:antarjak/views/dashboard/berita_panel.dart';
import 'package:antarjak/views/dashboard/pengaturan_panel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final panels = [
      BerandaPanel(),
      BeritaPanel(),
      PengaturanPanel(),
    ];
    return Consumer<dashboardProviders>(builder: (context, prov, w) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                prov.UbahTab(value);
                print('tab $value');
              },
              currentIndex: prov.tabaktif,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.house), label: 'beranda'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.newspaper), label: 'berita'),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.gear), label: 'pengaturan'),
              ]),
          body: panels[prov.tabaktif]);
    });
  }
}
