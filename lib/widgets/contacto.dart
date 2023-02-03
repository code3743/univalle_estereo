import 'package:flutter/material.dart';
import 'package:univalle_estereo/utils/custom_icons_icons.dart';
import 'package:univalle_estereo/utils/url_laucher.dart';

class Contacto extends StatelessWidget {
  const Contacto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/img/univalle.png',
                      height: 100,
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('¡Contáctanos!',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor)),
                          SizedBox(
                            child: Text(
                                'Puedes contactarnos a través de nuestras redes sociales o enviandonos un email. ',
                                style: Theme.of(context).textTheme.bodyLarge),
                          )
                        ]))
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => UrlLaucherApp.abrirUrl(
                        'http://emisora.univalle.edu.co/'),
                    icon: const Icon(CustomIcons.click)),
                IconButton(
                    onPressed: () => UrlLaucherApp.abrirUrl(
                        'https://m.facebook.com/univalleestereo'),
                    icon: const Icon(CustomIcons.facebook)),
                IconButton(
                    onPressed: () => UrlLaucherApp.abrirUrl(
                        'https://www.instagram.com/univallest'),
                    icon: const Icon(CustomIcons.instagram)),
                IconButton(
                    onPressed: () => UrlLaucherApp.abrirUrl(
                        'https://twitter.com/UnivalleSt'),
                    icon: const Icon(CustomIcons.twitter)),
                const IconButton(
                    onPressed: UrlLaucherApp.abirEmail,
                    icon: Icon(Icons.email_outlined)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
