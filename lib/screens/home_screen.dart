import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:univalle_estereo/providers/providers.dart';
import 'package:univalle_estereo/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BannerProvider bannerProvider = Provider.of<BannerProvider>(context);
    final NoticiasProvider noticiasProvider =
        Provider.of<NoticiasProvider>(context);

    final CheckConectionProvider checkConectionProvider =
        Provider.of<CheckConectionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Univalle Estéreo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              'assets/img/univalle.png',
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
      body: checkConectionProvider.conectado
          ? SingleChildScrollView(
              child: Column(
                children: [
                  BannerInfos(banners: bannerProvider.banners),
                  PostsInfo(
                    noticias: noticiasProvider.noticias,
                  ),
                  const Contacto()
                ],
              ),
            )
          : const VerificandoConexion(),
      bottomNavigationBar:
          const Hero(tag: 'univalle-estereo', child: ReproductorInfoBottom()),
    );
  }
}
