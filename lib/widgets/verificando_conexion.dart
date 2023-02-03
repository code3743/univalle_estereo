import 'package:flutter/material.dart';
import 'package:univalle_estereo/widgets/consultando.dart';

class VerificandoConexion extends StatelessWidget {
  const VerificandoConexion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '¡Ups! no tienes conexión a internet ',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Icon(
          Icons.wifi_off_rounded,
          size: MediaQuery.of(context).size.width * .5,
          color: Colors.grey,
        ),
        const Consulta(
          mensaje: 'Verificando la conexión ',
        )
      ],
    );
  }
}
