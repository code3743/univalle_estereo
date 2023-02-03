import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:univalle_estereo/providers/providers.dart';
import 'package:univalle_estereo/widgets/disco_rotante.dart';

class ReproductorInfoBottom extends StatelessWidget {
  const ReproductorInfoBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RadioOnlineProvider radioOnlineProvider =
        Provider.of<RadioOnlineProvider>(context);

    final CheckConectionProvider checkConectionProvider =
        Provider.of<CheckConectionProvider>(context);

    if (radioOnlineProvider.estado && !checkConectionProvider.conectado) {
      radioOnlineProvider.stop();
    }

    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        height: 100,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const _Reproductor();
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/img/disco.png',
                height: 70,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Señal en vivo',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '105.3 fm',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                ],
              ),
              checkConectionProvider.conectado
                  ? radioOnlineProvider.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : IconButton(
                          onPressed: radioOnlineProvider.estado
                              ? radioOnlineProvider.stop
                              : radioOnlineProvider.play,
                          icon: Icon(radioOnlineProvider.estado
                              ? Icons.pause_circle_rounded
                              : Icons.play_circle_rounded),
                          color: Colors.white,
                          iconSize: 40,
                        )
                  : const Icon(
                      Icons.wifi_off_rounded,
                      color: Colors.white,
                    )
            ],
          ),
        ));
  }
}

class _Reproductor extends StatelessWidget {
  const _Reproductor();

  @override
  Widget build(BuildContext context) {
    final RadioOnlineProvider radioOnlineProvider =
        Provider.of<RadioOnlineProvider>(context);
    final CheckConectionProvider checkConectionProvider =
        Provider.of<CheckConectionProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .7,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const DiscoRotante(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Señal en vivo',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (checkConectionProvider.conectado)
                  radioOnlineProvider.isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(color: Colors.black),
                        )
                      : IconButton(
                          onPressed: radioOnlineProvider.estado
                              ? radioOnlineProvider.stop
                              : radioOnlineProvider.play,
                          iconSize: 35,
                          icon: Icon(radioOnlineProvider.estado
                              ? Icons.pause_circle_rounded
                              : Icons.play_circle_rounded),
                        )
                else
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.wifi_off_rounded,
                      size: 35,
                      color: Colors.black,
                    ),
                  )
              ],
            ),
            Text(
              '105.3 fm',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ]),
    );
  }
}
