// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:univalle_estereo/models/noticias_model.dart';
import 'package:univalle_estereo/utils/htmlparse.dart';

class NoticiasProvider extends ChangeNotifier {
  final String _baseUrl = 'emisora.univalle.edu.co';
  final int _limiteConocido = 455;
  int _page = 0;
  bool _finDePage = false;
  bool _consultando = false;

  List<Noticia> noticias = [];

  NoticiasProvider() {
    getNoticias();
  }

  bool get consultando => _consultando;
  set consultando(bool value) {
    _consultando = value;
    notifyListeners();
  }

  bool get finPaginas => _finDePage;

  void reitentarPeticion() {
    noticias = [];
    _page = 0;
    getNoticias();
  }

  void getNoticias() async {
    if (_page > _limiteConocido && _finDePage) {
      _consultando = false;
      return;
    }
    _consultando = true;
    _page++;
    Uri url = Uri.http(
      _baseUrl,
      '/wp-json/wp/v2/posts',
      {'page': '$_page'},
    );

    try {
      List<Noticia> noticiasTemp = [];
      final response = await http.get(url);
      final resMap = json.decode(response.body);

      if (response.statusCode != 200) {
        if (_page > _limiteConocido) {
          _finDePage = true;
        }
        throw 'No se encontro resgistro';
      }
      for (Map<String, dynamic> info in resMap) {
        noticiasTemp.add(Noticia(
            titular: htmlToString(info['title']['rendered']),
            urlPost: info['link'],
            texto: htmlToString(info['content']['rendered']),
            id: info['id'].toString(),
            urlImagen: await getPosterNoticias(info['featured_media'])));
      }
      noticias.addAll(noticiasTemp);
      _consultando = false;
      notifyListeners();
    } catch (e) {
      if (!_finDePage) _page--;
      Future.error(e);
    }
  }

  Future<String?> getPosterNoticias(int id) async {
    if (id == 0) return null;

    final Uri url = Uri.http(_baseUrl, '/wp-json/wp/v2/media/$id');
    String? urlImagen = '';
    try {
      final res = await http.get(url);
      final resMap = json.decode(res.body);
      urlImagen = resMap['guid']['rendered'];
    } catch (e) {
      urlImagen = null;
    }
    return urlImagen;
  }
}
