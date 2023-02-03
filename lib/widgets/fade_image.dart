import 'package:flutter/material.dart';

class FadeImage extends StatelessWidget {
  const FadeImage(
      {super.key, required this.urlImage, this.borderRadius, this.fit});

  final String? urlImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        child: urlImage != null
            ? FadeInImage(
                placeholder: const AssetImage('assets/img/loader.gif'),
                image: NetworkImage(urlImage!),
                placeholderFit: BoxFit.contain,
                fit: fit ?? BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) => SizedBox(
                  child: Image.asset(
                    'assets/img/error-imagen.png',
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Image.asset(
                'assets/img/sin-imagen.png',
                fit: BoxFit.contain,
              ));
  }
}
