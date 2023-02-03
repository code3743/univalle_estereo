import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:univalle_estereo/providers/providers.dart';
import 'package:univalle_estereo/widgets/widgets.dart';

class OffLineScreen extends StatelessWidget {
  const OffLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckConectionProvider checkConectionProvider =
        Provider.of<CheckConectionProvider>(context);
    final NoticiasProvider noticiasProvider =
        Provider.of<NoticiasProvider>(context, listen: false);
    final BannerProvider bannerProvider =
        Provider.of<BannerProvider>(context, listen: false);

    if (checkConectionProvider.conectado) {
      noticiasProvider.reitentarPeticion();
      bannerProvider.getBanners();
      Future.microtask(() =>
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false));
    }

    return const Scaffold(
      body: SafeArea(child: VerificandoConexion()),
    );
  }
}
