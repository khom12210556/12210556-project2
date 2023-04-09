import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: 'beranda'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper), label: 'berita'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear), label: 'pengaturan'),
      ]),
      body: Stack(
        children: [
          Image.asset(
            'assets/background.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          profilpengguna(),
          Padding(
            padding: const EdgeInsets.only(
              top: 180,
              bottom: 0,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      labelBerita(),
                      listBerita(),
                      SizedBox(
                        height: 20,
                      ),
                      listMenu()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class listMenu extends StatelessWidget {
  const listMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TombolMenu(
          namaasset: 'assets/icon1.png',
        ),
        TombolMenu(
          namaasset: 'assets/icon3.png',
        ),
        TombolMenu(
          namaasset: 'assets/icon4.png',
        ),
      ],
    );
  }
}

class TombolMenu extends StatelessWidget {
  final String? namaasset;
  const TombolMenu({super.key, required this.namaasset});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 62, 175, 246),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Image.asset(
          namaasset!,
          width: 60,
        ),
      ),
    );
  }
}

class listBerita extends StatelessWidget {
  const listBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ItemBerita(
            alamatAsset: 'assets/berita1.jpg',
          ),
          ItemBerita(
            alamatAsset: 'assets/berita2.jpg',
          ),
          ItemBerita(
            alamatAsset: 'assets/berita3.jpg',
          ),
          ItemBerita(),
        ],
      ),
    );
  }
}

class ItemBerita extends StatelessWidget {
  final String? alamatAsset;
  const ItemBerita({super.key, this.alamatAsset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        alamatAsset ?? 'assets/noimage.jpg',
        height: 150,
        width: 250,
      ),
    );
  }
}

class labelBerita extends StatelessWidget {
  const labelBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Berita',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class profilpengguna extends StatelessWidget {
  const profilpengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                'profil.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Joko',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'hokagejoko@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'bell.png',
            width: 40,
          ),
        ],
      ),
    );
  }
}
