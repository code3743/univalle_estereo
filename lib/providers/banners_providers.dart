import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:univalle_estereo/models/banner_model.dart';

class BannerProvider extends ChangeNotifier {
  final String _baseUrl = 'emisora.univalle.edu.co';
  List<BannerModel> banners = [];
  BannerProvider() {
    getBanners();
  }

  void getBanners() async {
    Uri url = Uri.http(_baseUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw 'No se encontro resgistro';
      }
      final List<BannerModel> urlsImages = [];
      final List<String> ulData = response.body
          .split('<ul class="slides">')[1]
          .split('</ul>')[0]
          .split('img src="')
          .sublist(1);
      for (String element in ulData) {
        urlsImages.add(BannerModel(element.split('" alt')[0]));
      }
      banners = urlsImages;
      notifyListeners();
    } catch (e) {
      // throw Exception('Fallo la red');
    }
  }
}
