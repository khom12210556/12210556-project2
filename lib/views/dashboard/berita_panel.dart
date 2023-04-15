import 'package:antarjak/models/berita_model.dart';
import 'package:antarjak/provider/dashboard_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  const BeritaPanel({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BeritaLoadDataProvider>().refresh();

    return Scaffold(
      body: Consumer<BeritaLoadDataProvider>(builder: (context, prov, w) {
        return ListView(
          children: [
            for (BeritaModel bm in prov.data)
              Container(
                child: Column(
                  children: [
                    Image.network(
                      bm.image ?? '',
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/noimage.jpg');
                      },
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
