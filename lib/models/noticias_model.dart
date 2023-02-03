class Noticia {
  final String titular;
  final String urlPost;
  final String texto;
  final String id;
  final String? urlImagen;

  Noticia(
      {required this.titular,
      required this.urlPost,
      required this.texto,
      required this.id,
      this.urlImagen});
}
