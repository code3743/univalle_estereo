import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import 'package:univalle_estereo/models/noticias_model.dart';

import 'package:univalle_estereo/utils/custom_icons_icons.dart';
import 'package:univalle_estereo/utils/url_laucher.dart';
import 'package:univalle_estereo/widgets/widgets.dart';

class DetallePostScreen extends StatelessWidget {
  const DetallePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Noticia noticia =
        ModalRoute.of(context)?.settings.arguments as Noticia;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(
              onPressed: () {
                Share.share(
                    '¡Hola!, revisa este post, esta increíble\n${noticia.urlPost}');
              },
              icon: const Icon(Icons.share_rounded))
        ],
      ),
      body: Column(
        children: [
          const AlertaConectividad(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .35,
                      child: Hero(
                        tag: noticia.id,
                        child: FadeImage(
                          urlImage: noticia.urlImagen,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    noticia.titular,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.red, height: 1.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    noticia.texto,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                _LeerPost(
                  url: noticia.urlPost,
                ),
                const Contacto()
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          const Hero(tag: 'univalle-estereo', child: ReproductorInfoBottom()),
    );
  }
}

class _LeerPost extends StatelessWidget {
  const _LeerPost({
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () => UrlLaucherApp.abrirUrl(url),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                CustomIcons.click,
                color: Colors.white,
              ),
              Text(
                'Leer post en la web',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white, fontSize: 15),
              ),
            ],
          )),
    );
  }
}
