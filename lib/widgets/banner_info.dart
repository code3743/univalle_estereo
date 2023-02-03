import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:univalle_estereo/models/banner_model.dart';
import 'package:univalle_estereo/widgets/consultando.dart';
import 'package:univalle_estereo/widgets/fade_image.dart';

class BannerInfos extends StatelessWidget {
  const BannerInfos({
    super.key,
    required this.banners,
  });
  final List<BannerModel> banners;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: banners.isEmpty
          ? const Consulta()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Swiper(
                duration: 800,
                layout: SwiperLayout.DEFAULT,
                itemWidth: MediaQuery.of(context).size.width * .8,
                itemCount: banners.length,
                autoplay: true,
                pagination:
                    const SwiperPagination(builder: SwiperPagination.dots),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FadeImage(urlImage: banners[index].url),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
