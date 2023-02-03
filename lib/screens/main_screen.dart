import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:univalle_estereo/providers/providers.dart';
import 'package:univalle_estereo/utils/check_internet_connection.dart';
import 'package:univalle_estereo/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  image: const DecorationImage(
                      image: AssetImage('assets/img/home.png'),
                      fit: BoxFit.cover)),
            ),
            const _UVArdilla(),
            Positioned(
                bottom: MediaQuery.of(context).size.height * .5 - 125,
                child: const DiscoRotante(
                  estado: false,
                )),
            const Align(
              alignment: Alignment.bottomCenter,
              child: _MsjBienvenida(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MsjBienvenida extends StatelessWidget {
  const _MsjBienvenida();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '¡Hola Compa!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'disfruta de',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Univalle Estéreo',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                '105.3 fm',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Solo ',
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: 'toca',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' para iniciar',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ]),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 1),
                    onPressed: () {
                      final RadioOnlineProvider radioOnlineProvider =
                          Provider.of<RadioOnlineProvider>(context,
                              listen: false);
                      final CheckConectionProvider checkConectionProvider =
                          Provider.of<CheckConectionProvider>(context,
                              listen: false);
                      if (checkConectionProvider.connectionStatus ==
                          ConnectionStatus.online) {
                        radioOnlineProvider.play();
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home', (route) => false);
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'offline', (route) => false);
                      }
                    },
                    iconSize: 30,
                    color: Colors.white,
                    icon: const Icon(Icons.play_arrow_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UVArdilla extends StatelessWidget {
  const _UVArdilla();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: -50,
      child: Transform.rotate(
        angle: 1,
        alignment: Alignment.center, //origin: Offset(100, 100)
        child: SizedBox(
            height: 250, child: Image.asset('assets/img/UV_ardilla.png')),
      ),
    );
  }
}
