import 'package:antarjak/models/berita_model.dart';
import 'package:antarjak/provider/dashboard_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaLoadDataProvider>().refresh();

    return Scaffold(
      appBar: AppBar(
        title: _TitleBeritaPanel(),
        elevation: 30,
        backgroundColor: Color.fromARGB(255, 45, 255, 146),
        actions: [TombolActionBeritaPanel()],
      ),
      body: Consumer<BeritaLoadDataProvider>(builder: (context, prov, w) {
        return ListView(
          children: [
            for (BeritaModel bm in prov.data)
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        bm.image ?? '',
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/noimage.jpg');
                        },
                      ),
                      decoration: BoxDecoration(border: Border.all()),
                    ),
                    Text('${bm.title}')
                  ],
                ),
              )
          ],
        );
      }),
    );
  }
}

class TombolActionBeritaPanel extends StatelessWidget {
  const TombolActionBeritaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
      return IconButton(
          onPressed: () {
            prov.ubahmode();
          },
          icon: Visibility(
            visible: prov.modecari == true,
            child: Icon(FontAwesomeIcons.circleXmark),
            replacement: Icon(FontAwesomeIcons.magnifyingGlass),
          ));
    });
  }
}

class _TitleBeritaPanel extends StatelessWidget {
  const _TitleBeritaPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
      return Visibility(
        visible: prov.modecari,
        child: CupertinoSearchTextField(
          style: TextStyle(color: Colors.black),
          placeholderStyle:
              TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        replacement: Text('Berita Terkini'),
      );
    });
  }
}
