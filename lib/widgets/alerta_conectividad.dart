import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:univalle_estereo/providers/check_conection_provider.dart';

class AlertaConectividad extends StatelessWidget {
  const AlertaConectividad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CheckConectionProvider checkConectionProvider =
        Provider.of<CheckConectionProvider>(context);

    return Visibility(
        visible: !checkConectionProvider.conectado,
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.amber.shade300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Se perdio la conexión a internet',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16, color: Colors.black),
              ),
              const Icon(
                Icons.wifi_off_rounded,
                color: Colors.black,
              )
            ],
          ),
        ));
  }
}
