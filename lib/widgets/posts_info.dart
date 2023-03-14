import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:univalle_estereo/models/noticias_model.dart';
import 'package:univalle_estereo/providers/noticias_providers.dart';
import 'package:univalle_estereo/widgets/consultando.dart';
import 'package:univalle_estereo/widgets/fade_image.dart';

class PostsInfo extends StatelessWidget {
  const PostsInfo({
    super.key,
    required this.noticias,
  });

  final List<Noticia> noticias;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Posts',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          Expanded(
            child: noticias.isEmpty
                ? const Consulta()
                : _Posts(
                    noticias: noticias,
                  ),
          ),
        ],
      ),
    );
  }
}

class _Posts extends StatefulWidget {
  const _Posts({
    required this.noticias,
  });

  final List<Noticia> noticias;

  @override
  State<_Posts> createState() => _PostsState();
}

class _PostsState extends State<_Posts> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final NoticiasProvider noticiasProvider =
        Provider.of<NoticiasProvider>(context, listen: false);

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 900) {
        if (!noticiasProvider.finPaginas && !noticiasProvider.consultando) {
          noticiasProvider.getNoticias();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: widget.noticias.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'detalles',
                    arguments: widget.noticias[index]);
              },
              child: NoticiaItem(noticia: widget.noticias[index]),
            ));
      },
    );
  }
}

class NoticiaItem extends StatelessWidget {
  const NoticiaItem({
    super.key,
    required this.noticia,
  });

  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 200,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  spreadRadius: 1.5,
                  offset: const Offset(1, 5))
            ]),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: noticia.id,
                child: FadeImage(
                  urlImage: noticia.urlImagen,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Colors.red,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    noticia.titular,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white, fontSize: 16, height: 1.2),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
